import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/colors/app_colors.dart';

class LightColors extends AppColors {
  const LightColors()
    : super(
        primary: Colors.blue,
        primaryDark: Colors.blueAccent,
        background: Colors.white,
        surface: Colors.grey,
        text: Colors.black,
        textDark: Colors.white,
      );

  @override
  bool get isDarkMode => false;
}
