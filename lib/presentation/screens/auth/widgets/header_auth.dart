import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_spacing.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/utils/context_extensions.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key, required this.mainText, required this.secondText});

  final String mainText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mainText,
          style: AppTypography.h1.copyWith(color: context.colors.primary, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        AppSpacing.small(),
        Text(secondText, style: AppTypography.h4.copyWith(color: context.colors.surface), textAlign: TextAlign.start),
      ],
    );
  }
}
