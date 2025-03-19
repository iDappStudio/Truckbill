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
      appBarTheme: AppBarTheme(backgroundColor: colors.background, iconTheme: IconThemeData(color: colors.text)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: colors.primary, foregroundColor: colors.text),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.lightBlue,
        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(8.0))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: colors.primary, width: 2.0),
        ),
        hintStyle: TextStyle(color: colors.surface),
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
