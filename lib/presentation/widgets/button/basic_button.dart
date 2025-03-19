import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/presentation/theme/colors/light_app_color.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = LightColors();
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.primary),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(350, 60),
          backgroundColor: colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(text, style: AppTypography.h2.copyWith(color: colors.white)),
      ),
    );
  }
}
