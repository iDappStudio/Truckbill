import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/presentation/widgets/assets/svg_icon.dart';

class LoginSocials extends StatelessWidget {
  const LoginSocials({super.key, required this.text, required this.assetName, required this.onPressed});

  final String text;
  final String assetName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimens.xxl,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: SvgIcon(assetName: assetName),
        label: Text(text, style: AppTypography.h4),
      ),
    );
  }
}
