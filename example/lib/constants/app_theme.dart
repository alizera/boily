import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dimens.dart';
import 'font_family.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static int get _appBrightnessShade => 240;

  static bool get centerTitle => true;

  static Brightness get appBrightness => Brightness.light;

  static MaterialColor get appPrimarySwatch =>
      MaterialColor(AppColors.blue[500].value, AppColors.blue);

  static Color get appPrimaryColor => AppColors.blue[500];

  static Color get appScaffoldBackgroundColor => Color.fromARGB(
      255, _appBrightnessShade, _appBrightnessShade, _appBrightnessShade);

  static ThemeData getLightTheme() {
    return ThemeData(
      fontFamily: FontFamily.IranSans,
      brightness: appBrightness,
      primarySwatch: appPrimarySwatch,
      primaryColor: appPrimaryColor,
      primaryColorBrightness: appBrightness,
      accentColor: appPrimaryColor,
      cursorColor: appPrimaryColor,
      errorColor: Colors.redAccent,
      accentColorBrightness: appBrightness,
      cardTheme: getCardTheme(),
      inputDecorationTheme: getInputDecorationTheme(),
      buttonTheme: getButtonTheme(),
      appBarTheme: getAppBarTheme(),
      textTheme: getTextTheme(),
      scaffoldBackgroundColor: appScaffoldBackgroundColor,
      snackBarTheme: getSnackBarTheme(),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      fontFamily: FontFamily.IranSans,
      brightness: appBrightness,
      primarySwatch: appPrimarySwatch,
      primaryColor: appPrimaryColor,
      primaryColorBrightness: appBrightness,
      accentColor: appPrimaryColor,
      cursorColor: appPrimaryColor,
      accentColorBrightness: appBrightness,
      cardTheme: getCardTheme(),
      inputDecorationTheme: getInputDecorationTheme(),
      buttonTheme: getButtonTheme(),
      appBarTheme: getAppBarTheme(),
      textTheme: getTextTheme(),
      scaffoldBackgroundColor: appScaffoldBackgroundColor,
      snackBarTheme: getSnackBarTheme(),
    );
  }

  static TextTheme getTextTheme() {
    return const TextTheme().copyWith(
      bodyText2: const TextStyle(fontSize: 12),
      bodyText1: const TextStyle(fontSize: 12),
      button: const TextStyle(fontSize: 13),
      headline4: TextStyle(color: Colors.grey, fontSize: 20),
      headline3: TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontFamily: '',
          fontWeight: FontWeight.w700),
      headline2: TextStyle(color: Colors.grey, fontSize: 13),
      headline1: TextStyle(
          color: Colors.grey,
          fontSize: 13,
          fontFamily: '',
          fontWeight: FontWeight.w700),
    );
  }

  static AppBarTheme getAppBarTheme() {
    return AppBarTheme(
        color: appScaffoldBackgroundColor,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: const IconThemeData(opacity: 0.8),
        textTheme: getTextTheme().copyWith(
            headline6: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontFamily: FontFamily.IranSans,
              fontWeight: FontWeight.w700,
            )));
  }

  static CardTheme getCardTheme() {
    return const CardTheme().copyWith(
        color: Colors.white,
        elevation: Dimens.elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.radiusMedium)));
  }

  static InputDecorationTheme getInputDecorationTheme() {
    return InputDecorationTheme(
//      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      focusColor: Colors.red,
      helperMaxLines: 3,

      filled: true,
      alignLabelWithHint: true,
    );
  }

  static ButtonThemeData getButtonTheme() {
    return ButtonThemeData(
        buttonColor: Colors.blueAccent,
        textTheme: ButtonTextTheme.primary,
        splashColor: Colors.cyan,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))));
  }

  static SnackBarThemeData getSnackBarTheme() {
    return SnackBarThemeData(
      contentTextStyle: getTextTheme().bodyText2.copyWith(
        color: Colors.white,
        fontFamily: FontFamily.IranSans,
      ),
    );
  }
}

class AppColors {
  AppColors._(); // this basically makes it so you can instantiate this class

  static Map<int, Color> blue = <int, Color>{
    50: Colors.blue[50],
    100: Colors.blue[100],
    200: Colors.blue[200],
    300: Colors.blue[300],
    400: Colors.blue[400],
    500: Colors.blue[500],
    600: Colors.blue[600],
    700: Colors.blue[700],
    800: Colors.blue[800],
    900: Colors.blue[900],
  };
}
