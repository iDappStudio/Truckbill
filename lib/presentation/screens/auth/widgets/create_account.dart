import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/presentation/theme/colors/light_app_color.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = LightColors();
    return GestureDetector(
      onTap: () => context.go('/createAcc'),
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: AppTypography.h5.copyWith(color: colors.surface),
          children: [
            TextSpan(
              text: "Sign up",
              style: AppTypography.h5.copyWith(fontWeight: FontWeight.bold, color: colors.primary),
            ),
          ],
        ),
      ),
    );
  }
}