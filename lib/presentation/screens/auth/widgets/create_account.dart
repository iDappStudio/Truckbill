import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/utils/context_extensions.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        //context.go(AppRoutes.createAccount)
      },
      child: RichText(
        text: TextSpan(
          text: '${context.s.dont_have_account} ',
          style: AppTypography.h5.copyWith(color: context.colors.surface),
          children: [
            TextSpan(
              text: context.s.sign_up,
              style: AppTypography.h5.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
