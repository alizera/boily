import 'package:mobx/mobx.dart';

part 'boily_message_store.g.dart';

class BoilyMessageStore = _BoilyMessageStore with _$BoilyMessageStore;

abstract class _BoilyMessageStore with Store {
  @observable
  String infoMessage;

  @action
  void resetInfoSnack() {
    infoMessage = null;
  }
}
