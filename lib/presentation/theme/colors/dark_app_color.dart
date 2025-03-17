import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/colors/app_colors.dart';

class DarkColors extends AppColors {
  const DarkColors()
    : super(
        primary: Colors.blue,
        primaryDark: Colors.blueAccent,
        background: Colors.black,
        surface: Colors.grey,
        text: Colors.white,
        textDark: Colors.black,
      );

  @override
  bool get isDarkMode => true;
}
