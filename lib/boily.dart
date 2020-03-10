library boily;

// ignore: avoid_classes_with_only_static_members
class Boily {
  static String disconnectMessage;
  static String tryAgainButtonText;
  static String emptyWidgetMessage;
  static String errorMessage;

  static void init(
      String defaultDisconnectMessage,
      String defaultTryAgainButtonText,
      String defaultEmptyWidgetText,
      String defaultErrorMessage) {
    disconnectMessage = defaultDisconnectMessage;
    tryAgainButtonText = defaultTryAgainButtonText;
    emptyWidgetMessage = defaultEmptyWidgetText;
    errorMessage = defaultEmptyWidgetText;
  }
}
