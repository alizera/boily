import 'package:mobx/mobx.dart';

part 'boily_message_store.g.dart';

class BoilyMessageStore = _BoilyMessageStore with _$BoilyMessageStore;

abstract class _BoilyMessageStore with Store {
  @observable
  String infoMessage;

  @observable
  String successMessage;

  @action
  void resetInfoMessage() {
    infoMessage = null;
  }

  @action
  void resetSuccessMessage() {
    successMessage = null;
  }

  @action
  void resetAllMessages() {
    resetInfoMessage();
    resetSuccessMessage();
  }
}
