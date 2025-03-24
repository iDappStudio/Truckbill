import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/theme/app_spacing.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/utils/context_extensions.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key, required this.mainText, required this.secondText});

  final String mainText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.s),
      child: Center(
        child: Column(
          children: [
            Text(mainText, style: AppTypography.h1.copyWith(color: context.colors.primary, fontSize: AppDimens.xxl)),
            AppSpacing.small(),
            Text(secondText, style: AppTypography.h4.copyWith(color: context.colors.surface)),
          ],
        ),
      ),
    );
  }
}
