class Endpoints {
  Endpoints._();

  // base url
  static const String _rawUrl = "https://xchange98.cash/api/app/";

  static const String _version = "v1";

  static const String _version2 = "v2";

  static const String _suffixAddress = "?action=";

  static const String baseUrl = "$_rawUrl$_version$_suffixAddress";

  static const String baseUrlV2 = "$_rawUrl$_version2$_suffixAddress";

  static String _baseUrl(String endPoint) => "$baseUrl$endPoint";

  static String _baseUrlV2(String endPoint) => "$baseUrlV2$endPoint";

  // booking endpoints
  static String get login => _baseUrl("login");

  // receiveTimeout
  static const int receiveTimeout = 10000;

  // connectTimeout
  static const int connectionTimeout = 10000;
}
