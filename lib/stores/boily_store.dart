import 'dart:async';
import 'dart:developer';

import 'package:boily/boily.dart';
import 'package:boily/stores/boily_form_store.dart';
import 'package:boily/stores/boily_message_store.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import 'boily_error_store.dart';

part 'boily_store.g.dart';

enum StoreStatus {
  // to be safe in states
  none,
  // to show full screen loading
  fetching,
  // to show overlay loading
  loading,
  // to handle success response from API
  success,
  // to handle APIs errors and show full screen error
  error,
  // to handle errors and show overlay error (snack)
  warn,
  // to show given empty widget
  empty,
}

class BoilyStore = _BoilyStore with _$BoilyStore;

abstract class _BoilyStore with Store {

  List<BoilyFormStore> _boilyFormStores;

  final BoilyMessageStore messageStore;

  @observable
  StoreStatus _status = StoreStatus.none;

  @computed
  StoreStatus get status => _status;

  @computed
  bool get isLoading => status == StoreStatus.loading;

  @computed
  bool get isFetching => status == StoreStatus.fetching;

  @computed
  bool get isSuccess => status == StoreStatus.success;

  @computed
  bool get isError => status == StoreStatus.error;

  @computed
  bool get isWarn => status == StoreStatus.warn;

  @computed
  bool get isEmpty => status == StoreStatus.empty;

  @observable
  bool isDisconnected = false;

  @observable
  String successSnack;

  @observable
  String infoSnack;

  final BoilyErrorStore errorStore = BoilyErrorStore();
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectionSubscription;

  _BoilyStore(this.messageStore) {
    _connectivity
        .checkConnectivity()
        .then((value) => isDisconnected = value == ConnectivityResult.none);
    _connectionSubscription =
        _connectivity.onConnectivityChanged.listen((event) {
          handleConnection(event);
        });
  }

  // ignore: use_setters_to_change_properties
  @protected
  void initForm(List<BoilyFormStore> boilyFormStores) {
    _boilyFormStores = boilyFormStores;
  }

  @action
  void handleConnection(ConnectivityResult event) {
    log('connection: $event');
    isDisconnected = event == ConnectivityResult.none;
    if (isDisconnected) {
      onWarn(warn: Boily.disconnectMessage ?? 'Internet Connection Lost...');
      if (isFetching) {
        onError(
            error: Boily.disconnectMessage ?? 'Internet Connection Lost...');
//          errorStore.errorMessage =
//              Boily.disconnectMessage ?? 'Internet Connection Lost...';
      }
    }
  }

  void dispose() {
    log('BoilyStore -> dispose');
    setStatus(StoreStatus.none);
    resetSnacks();
    errorStore.resetErrors();
    _boilyFormStores?.forEach((element) => element.reset());
    _connectionSubscription.cancel();
  }

  @protected
  @action
  void onFetch({Function doMore}) {
    log('Boilystore -> onFetch');
    if (isDisconnected) {
      onError(error: Boily.disconnectMessage ?? 'Internet Connection Lost...');
    } else {
      setStatus(StoreStatus.fetching);
    }
    if (doMore != null) doMore();
  }

  @protected
  @action
  void onRequest({Function doMore}) {
    log('Boilystore -> onRequest');
    if (isDisconnected) {
      onError(error: Boily.disconnectMessage ?? 'Internet Connection Lost...');
    } else {
      setStatus(StoreStatus.loading);
    }
    if (doMore != null) doMore();
  }

  @protected
  @action
  void onSuccess({Function doMore}) {
    log('Boilystore -> onSuccess');
    setStatus(StoreStatus.success);
    errorStore.errorMessage = null;
    if (doMore != null) doMore();
  }

  @protected
  @action
  void onError({@required String error, Function doMore}) {
    log('Boilystore -> onError, error: $error');
    setStatus(StoreStatus.error);
    errorStore.errorMessage = (error?.isNotEmpty ?? false)
        ? error
        : (Boily.errorMessage?.isNotEmpty ?? false)
        ? Boily.errorMessage
        : 'متاسفانه خطایی رخ داده است!';
    if (doMore != null) doMore();
  }

  @protected
  @action
  void onWarn({@required String warn, Function doMore}) {
    log('Boilystore -> onWarn, error: $warn');
    setStatus(StoreStatus.warn);
    errorStore.snackError = (warn != null && warn.isNotEmpty)
        ? warn
        : 'متاسفانه خطایی رخ داده است!';
    if (doMore != null) doMore();
  }

  @protected
  @action
  void onEmpty({Function doMore}) {
    log('Boilystore -> onEmpty');
    setStatus(StoreStatus.empty);
    if (doMore != null) doMore();
  }

  @protected
  @action
  void setStatus(StoreStatus status) {
    log('BoilyStore.staus -> $status');
    _status = status;
  }

  @action
  void resetSuccessSnack() {
    successSnack = null;
  }

  @action
  void resetInfoSnack() {
    infoSnack = null;
  }

  @action
  void resetSnacks() {
    resetInfoSnack();
    resetSuccessSnack();
  }
}
