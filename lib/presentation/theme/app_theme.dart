import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
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
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, AppDimens.xxl),
          backgroundColor: colors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.s)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          side: BorderSide(color: colors.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.xl)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colors.primary, width: AppDimens.l),
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.s)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.s)),
          borderSide: BorderSide(color: colors.primary, width: AppDimens.xs),
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
