// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boily_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoilyStore on _BoilyStore, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading)).value;
  Computed<bool> _$isFetchingComputed;

  @override
  bool get isFetching =>
      (_$isFetchingComputed ??= Computed<bool>(() => super.isFetching)).value;
  Computed<bool> _$isSuccessComputed;

  @override
  bool get isSuccess =>
      (_$isSuccessComputed ??= Computed<bool>(() => super.isSuccess)).value;
  Computed<bool> _$isErrorComputed;

  @override
  bool get isError =>
      (_$isErrorComputed ??= Computed<bool>(() => super.isError)).value;
  Computed<bool> _$isWarnComputed;

  @override
  bool get isWarn =>
      (_$isWarnComputed ??= Computed<bool>(() => super.isWarn)).value;
  Computed<bool> _$isEmptyComputed;

  @override
  bool get isEmpty =>
      (_$isEmptyComputed ??= Computed<bool>(() => super.isEmpty)).value;

  final _$statusAtom = Atom(name: '_BoilyStore.status');

  @override
  StoreStatus get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(StoreStatus value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$isDisconnectedAtom = Atom(name: '_BoilyStore.isDisconnected');

  @override
  bool get isDisconnected {
    _$isDisconnectedAtom.context.enforceReadPolicy(_$isDisconnectedAtom);
    _$isDisconnectedAtom.reportObserved();
    return super.isDisconnected;
  }

  @override
  set isDisconnected(bool value) {
    _$isDisconnectedAtom.context.conditionallyRunInAction(() {
      super.isDisconnected = value;
      _$isDisconnectedAtom.reportChanged();
    }, _$isDisconnectedAtom, name: '${_$isDisconnectedAtom.name}_set');
  }

  final _$successSnackAtom = Atom(name: '_BoilyStore.successSnack');

  @override
  String get successSnack {
    _$successSnackAtom.context.enforceReadPolicy(_$successSnackAtom);
    _$successSnackAtom.reportObserved();
    return super.successSnack;
  }

  @override
  set successSnack(String value) {
    _$successSnackAtom.context.conditionallyRunInAction(() {
      super.successSnack = value;
      _$successSnackAtom.reportChanged();
    }, _$successSnackAtom, name: '${_$successSnackAtom.name}_set');
  }

  final _$infoSnackAtom = Atom(name: '_BoilyStore.infoSnack');

  @override
  String get infoSnack {
    _$infoSnackAtom.context.enforceReadPolicy(_$infoSnackAtom);
    _$infoSnackAtom.reportObserved();
    return super.infoSnack;
  }

  @override
  set infoSnack(String value) {
    _$infoSnackAtom.context.conditionallyRunInAction(() {
      super.infoSnack = value;
      _$infoSnackAtom.reportChanged();
    }, _$infoSnackAtom, name: '${_$infoSnackAtom.name}_set');
  }

  final _$_BoilyStoreActionController = ActionController(name: '_BoilyStore');

  @override
  void resetStore() {
    final _$actionInfo = _$_BoilyStoreActionController.startAction();
    try {
      return super.resetStore();
    } finally {
      _$_BoilyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onFetch({Function doMore}) {
    final _$actionInfo = _$_BoilyStoreActionController.startAction();
    try {
      return super.onFetch(doMore: doMore);
    } finally {
      _$_BoilyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onRequest({Function doMore}) {
    final _$actionInfo = _$_BoilyStoreActionController.startAction();
    try {
      return super.onRequest(doMore: doMore);
    } finally {
      _$_BoilyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSuccess({Function doMore}) {
    final _$actionInfo = _$_BoilyStoreActionController.startAction();
    try {
      return super.onSuccess(doMore: doMore);
    } finally {
      _$_BoilyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onError({@required String error, Function doMore}) {
    final _$actionInfo = _$_BoilyStoreActionController.startAction();
    try {
      return super.onError(error: error, doMore: doMore);
    } finally {
      _$_BoilyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onWarn({@required String warn, Function doMore}) {
    final _$actionInfo = _$_BoilyStoreActionController.startAction();
    try {
      return super.onWarn(warn: warn, doMore: doMore);
    } finally {
      _$_BoilyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSuccessSnack() {
    final _$actionInfo = _$_BoilyStoreActionController.startAction();
    try {
      return super.resetSuccessSnack();
    } finally {
      _$_BoilyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetInfoSnack() {
    final _$actionInfo = _$_BoilyStoreActionController.startAction();
    try {
      return super.resetInfoSnack();
    } finally {
      _$_BoilyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSnacks() {
    final _$actionInfo = _$_BoilyStoreActionController.startAction();
    try {
      return super.resetSnacks();
    } finally {
      _$_BoilyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'status: ${status.toString()},isDisconnected: ${isDisconnected.toString()},successSnack: ${successSnack.toString()},infoSnack: ${infoSnack.toString()},isLoading: ${isLoading.toString()},isFetching: ${isFetching.toString()},isSuccess: ${isSuccess.toString()},isError: ${isError.toString()},isWarn: ${isWarn.toString()},isEmpty: ${isEmpty.toString()}';
    return '{$string}';
  }
}
