import 'package:flutter/cupertino.dart';

class Dimens {
  Dimens._();

  static const double radiusLow = 5;
  static const double radiusMedium = 10;
  static const double radiusHigh = 20;

  static const double paddingSmallxxValue = 2.0;
  static const double paddingSmallxValue = 4.0;
  static const double paddingSmallValue = 8.0;
  static const double paddingMediumValue = 16.0;
  static const double paddingLargeValue = 32.0;

  static const double rowMinHeight = 50.0;
  static const double rowMinWidth = double.infinity;

  static const double elevation = 0.0;

  static const double fontSizeSmall = 10;
  static const double fontSizeMedium = 14;
  static const double fontSizeBig = 18;

  static EdgeInsets paddingSmallxx(
          {double vertical = paddingSmallxxValue,
          double horizontal = paddingSmallxxValue}) =>
      EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);

  static EdgeInsets paddingSmallx(
          {double vertical = paddingSmallxValue,
          double horizontal = paddingSmallxValue}) =>
      EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);

  static EdgeInsets paddingSmall(
          {double vertical = paddingSmallValue,
          double horizontal = paddingSmallValue}) =>
      EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);

  static EdgeInsets paddingMedium(
          {double vertical = paddingMediumValue,
          double horizontal = paddingMediumValue}) =>
      EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);

  static EdgeInsets paddingLarge(
          {double vertical = paddingLargeValue,
          double horizontal = paddingLargeValue}) =>
      EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);
}
