import 'package:mobx/mobx.dart';

part 'boily_error_store.g.dart';

class BoilyErrorStore = _BoilyErrorStore with _$BoilyErrorStore;

abstract class _BoilyErrorStore with Store {
  // constructor:---------------------------------------------------------------
  _BoilyErrorStore();

  // store variables:-----------------------------------------------------------
  @observable
  String snackError;

  @observable
  String errorMessage;

  @action
  void resetSnackError() {
    print('resetSnackError');
    snackError = null;
  }
}
