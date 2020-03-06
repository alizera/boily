// ignore: avoid_classes_with_only_static_members
class Assets {
  // prefixes
  static String get _imagePrefix => 'assets/images/';

  static String get _iconPrefix => 'assets/icons/';

  // methods
  static String _icon(String fileName) {
    return '$_iconPrefix$fileName.png';
  }

  static String _image(String fileName) {
    return '$_imagePrefix$fileName.png';
  }

  // values

  static String get appLogo => _image('app_logo');
}
