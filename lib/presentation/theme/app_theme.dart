import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/colors/app_colors.dart';
import 'package:truckbill/presentation/theme/colors/dark_app_color.dart';
import 'package:truckbill/presentation/theme/colors/light_app_color.dart';

class AppTheme {
  static ThemeData getTheme(AppColors colors) {
    return ThemeData(
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
  static ThemeData get light {
    return AppTheme.getTheme(LightColors());
  }

  static ThemeData get dark {
    return AppTheme.getTheme(DarkColors());
  }
}
