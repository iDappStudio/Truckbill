import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors({
    required this.primary,
    required this.primaryDark,
    required this.background,
    required this.surface,
    required this.text,
    required this.textDark,
    this.warning = Colors.red,
    this.success = Colors.green,
    this.transparent = Colors.transparent,
    this.white = Colors.white,
    this.black = Colors.black,
  });

  final Color primary;
  final Color primaryDark;
  final Color background;
  final Color warning;
  final Color success;
  final Color surface;
  final Color text;
  final Color textDark;
  final Color transparent;
  final Color white;
  final Color black;

  bool get isDarkMode;

  ColorScheme get colorScheme => ColorScheme(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primary: primary,
        onPrimary: textDark,
        secondary: primaryDark,
        onSecondary: textDark,
        surface: surface,
        onSurface: text,
        error: warning,
        onError: white,
        shadow: transparent,       
      );
}
