import 'package:boily/stores/boily_store.dart';
import 'package:boily/utils/dio/dio_error_util.dart';
import 'package:example/data/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore extends BoilyStore with Store {
  final Repository _repository;
  _LoginStore(this._repository);

  TextEditingController userNameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @action
  void login({bool isTryAgain = false, bool isSuccess = true}) {
    if (isTryAgain) {
      onFetch();
    } else {
      onRequest();
    }
    _repository
        .login(userNameController.text, passwordController.text, isSuccess)
        .then((value) => value.status
            ? onSuccess(doMore: () => successSnack = "ok ok ok ok ok")
            : onError(error: value.message, doMore: ()=> errorStore.snackError = "ffffuccccck"))
        .catchError((e) => onError(error: DioErrorUtil.handleError(e)));
  }

  @override
  void dispose() {
    print('login store dispose');
    super.dispose();
  }
}
