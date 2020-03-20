import 'package:mobx/mobx.dart';

part 'boily_form_store.g.dart';

class BoilyFormStore = _BoilyFormStore with _$BoilyFormStore;

typedef ItemValidator = bool Function();

abstract class _BoilyFormStore with Store {
  List<ItemValidator> _validators;
  bool isValidated = false;

  _BoilyFormStore();

  void init(List<ItemValidator> validators) {
    _validators = validators;
  }

  void reset() {}

  bool isValid() {
    isValidated = true;
    var isValid = true;
    _validators?.forEach((element) {
      if (!element()) {
        isValid = false;
      }
    });
    return isValid;
  }
}
