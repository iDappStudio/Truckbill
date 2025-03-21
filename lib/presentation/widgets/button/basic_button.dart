import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.primary),
      child: Center(child: Text(text, style: AppTypography.h2.copyWith(color: colors.onPrimary))),
    );
  }
}