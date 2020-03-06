// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boily_error_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoilyErrorStore on _BoilyErrorStore, Store {
  final _$snackErrorAtom = Atom(name: '_BoilyErrorStore.snackError');

  @override
  String get snackError {
    _$snackErrorAtom.context.enforceReadPolicy(_$snackErrorAtom);
    _$snackErrorAtom.reportObserved();
    return super.snackError;
  }

  @override
  set snackError(String value) {
    _$snackErrorAtom.context.conditionallyRunInAction(() {
      super.snackError = value;
      _$snackErrorAtom.reportChanged();
    }, _$snackErrorAtom, name: '${_$snackErrorAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_BoilyErrorStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$_BoilyErrorStoreActionController =
      ActionController(name: '_BoilyErrorStore');

  @override
  void resetSnackError() {
    final _$actionInfo = _$_BoilyErrorStoreActionController.startAction();
    try {
      return super.resetSnackError();
    } finally {
      _$_BoilyErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'snackError: ${snackError.toString()},errorMessage: ${errorMessage.toString()}';
    return '{$string}';
  }
}
