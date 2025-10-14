import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/font/font_weight_helper.dart';

class AppTextStyles {
  static const String _fontFamily = 'Tajawal';

  static TextStyle custom({
    double? size,
    Color? color,
    FontWeight? weight,
    double? height,
    FontStyle? style,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
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
