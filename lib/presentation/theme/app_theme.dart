import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/colors/app_colors.dart';

class AppTheme {
  static ThemeData getTheme(AppColors colors) {
    return ThemeData(
      brightness: colors.isDarkMode ? Brightness.dark : Brightness.light,
      primaryColor: colors.primary,
      scaffoldBackgroundColor: colors.background,
      colorScheme: colors.colorScheme, 
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        iconTheme: IconThemeData(color: colors.text),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.text,
        ),
      ),
    );
  }
}
