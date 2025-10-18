import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backPrimary,
      primaryColor: AppColors.primary,
      brightness: Brightness.light,
    );
  }
}
