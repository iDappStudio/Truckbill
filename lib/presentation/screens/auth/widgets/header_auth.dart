import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key, required this.mainText, required this.secondText});

  final String mainText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.s),
      child: Center(
        child: Column(
          children: [
            Text(mainText, style: AppTypography.h1.copyWith(color: colors.primary, fontSize: AppDimens.xxl)),
            SizedBox(height: AppDimens.s),
            Text(secondText, style: AppTypography.h4.copyWith(color: colors.surface)),
          ],
        ),
      ),
    );
  }
}
