import 'dart:developer';

import 'package:mobx/mobx.dart';

part 'boily_error_store.g.dart';

class BoilyErrorStore = _BoilyErrorStore with _$BoilyErrorStore;

abstract class _BoilyErrorStore with Store {
  _BoilyErrorStore();

  @observable
  String snackError;

  @observable
  String errorMessage;

  @action
  void resetErrors() {
    log('BoilyErrorStore -> resetErrors');
    snackError = null;
    errorMessage = null;
  }
}
