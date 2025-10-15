import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_constants.dart';
import 'package:itlegend_flutter_challenge/core/style/font/font_weight_helper.dart';

class AppTextStyles {
  static const String _tajawalFont = AppConstants.tajawalFont;

  static TextStyle custom({
    double? size,
    Color? color,
    FontWeight? weight,
    double? height,
    FontStyle? style,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: _tajawalFont,
      fontSize: size,
      fontWeight: weight ?? FontWeightHelper.regular,
      color: color,
      height: height,
      fontStyle: style,
      decoration: decoration,
    );
  }

  static TextStyle copyWith(
    TextStyle base, {
    double? size,
    Color? color,
    FontWeight? weight,
    double? height,
    FontStyle? style,
    TextDecoration? decoration,
  }) {
    return base.copyWith(
      fontSize: size,
      color: color,
      fontWeight: weight,
      height: height,
      fontStyle: style,
      decoration: decoration,
    );
  }

  static TextStyle font12Medium({Color? color}) =>
      custom(size: 12, weight: FontWeightHelper.medium, color: color);
}
