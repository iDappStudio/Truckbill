import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/presentation/theme/colors/light_app_color.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key, required this.mainText, required this.secondText});

  final String mainText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    final colors = LightColors();
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.s),
      child: Center(
        child: Column(
          children: [
            Text(mainText, style: AppTypography.h1.copyWith(fontSize: 40, color: colors.primary)),
            SizedBox(height: AppDimens.s),
            Text(secondText, style: AppTypography.h4.copyWith(color: colors.surface)),
          ],
        ),
      ),
    );
  }
}
