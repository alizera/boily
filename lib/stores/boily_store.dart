import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import 'boily_error_store.dart';

part 'boily_store.g.dart';

enum StoreStatus {
  none,
  fetching,
  loading,
  success,
  error,
  warn,
  empty,
}

class BoilyStore = _BoilyStore with _$BoilyStore;

abstract class _BoilyStore with Store {

  @observable
  StoreStatus status = StoreStatus.none;

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

  _BoilyStore() {
    _connectivity
        .checkConnectivity()
        .then((value) => isDisconnected = value == ConnectivityResult.none);
    _connectionSubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      print('connection: $event');
      isDisconnected = event == ConnectivityResult.none;
      if (isDisconnected) {
        errorStore.snackError = 'connection';
      }
    });
  }

  void dispose() {
    print('base store dispose');
    _connectionSubscription.cancel();
  }

  @action
  void resetStore() {
    status = StoreStatus.none;
    errorStore.resetSnackError();
  }

  @protected
  @action
  void onFetch({Function doMore}) {
    status = StoreStatus.fetching;
    if (doMore != null) doMore();
    if (isDisconnected) errorStore.resetSnackError();
  }

  @protected
  @action
  void onRequest({Function doMore}) {
    status = StoreStatus.loading;
    if (doMore != null) doMore();
    if (isDisconnected) errorStore.resetSnackError();
  }

  @protected
  @action
  void onSuccess({Function doMore}) {
    status = StoreStatus.success;
    errorStore.errorMessage = null;
    if (doMore != null) doMore();
  }

  @protected
  @action
  void onError({@required String error, Function doMore}) {
    status = StoreStatus.error;
    errorStore.errorMessage = (error != null && error.isNotEmpty)
        ? error
        : 'متاسفانه خطایی رخ داده است!';
    if (doMore != null) doMore();
  }

  @protected
  @action
  void onWarn({@required String warn, Function doMore}) {
    status = StoreStatus.warn;
    errorStore.snackError = (warn != null && warn.isNotEmpty)
        ? warn
        : 'متاسفانه خطایی رخ داده است!';
    if (doMore != null) doMore();
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
