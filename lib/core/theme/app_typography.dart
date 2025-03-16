import 'package:flutter/material.dart';
import 'package:truckbill/core/theme/app_colors.dart';

class AppTypography {
  // Light 
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: TextStyle(color: AppColors.lightText, fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(color: AppColors.lightText, fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(color: AppColors.lightText, fontSize: 12, fontWeight: FontWeight.normal),
    headlineSmall: TextStyle(color: AppColors.lightText, fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(color: AppColors.lightText, fontSize: 28, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(color: AppColors.lightText, fontSize: 24, fontWeight: FontWeight.bold),
  );

  // Dark
  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: TextStyle(color: AppColors.darkText, fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(color: AppColors.darkText, fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(color: AppColors.darkText, fontSize: 12, fontWeight: FontWeight.normal),
    headlineSmall: TextStyle(color: AppColors.darkText, fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(color: AppColors.darkText, fontSize: 28, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(color: AppColors.darkText, fontSize: 24, fontWeight: FontWeight.bold),
  );

}
