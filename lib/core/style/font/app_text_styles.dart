import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_constants.dart';
import 'package:itlegend_flutter_challenge/core/style/font/font_weight_helper.dart';

class AppTextStyles {
  static const String tajawalFont = AppConstants.tajawalFont;

  static TextStyle custom({
    double? size,
    Color? color,
    FontWeight? weight,
    double? height,
    FontStyle? style,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: tajawalFont,
      fontSize: size,
      fontWeight: weight ?? FontWeightHelper.regular,
      color: color,
      height: height,
      fontStyle: style,
      decoration: decoration,
    );
  }

  static TextStyle font16WhiteW900() =>
      custom(size: 16, color: Colors.white, weight: FontWeightHelper.black);
}
