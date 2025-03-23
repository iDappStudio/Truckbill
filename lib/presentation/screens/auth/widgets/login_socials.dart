import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/presentation/widgets/assets/svg_icon.dart';
import 'package:truckbill/utils/context_extensions.dart';

class LoginSocials extends StatelessWidget {
  const LoginSocials({super.key, required this.text, required this.assetName});

  final String text;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      width: double.infinity,
      height: AppDimens.xxl,
      child: TextButton.icon(
        onPressed: () {},
        icon: SvgIcon(assetName: assetName),
        label: Text(text, style: AppTypography.h4),
        style: TextButton.styleFrom(
          side: BorderSide(color: colors.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.xl)),
        ),
      ),
    );
  }
}
