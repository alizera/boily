// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void login({bool isTryAgain = false, bool isSuccess = true}) {
    final _$actionInfo = _$_LoginStoreActionController.startAction();
    try {
      return super.login(isTryAgain: isTryAgain, isSuccess: isSuccess);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = '';
    return '{$string}';
  }
}
