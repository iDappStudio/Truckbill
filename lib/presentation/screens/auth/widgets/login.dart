import 'package:flutter/material.dart';
import 'package:truckbill/presentation/router/app_router.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/utils/context_extensions.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => SignInRoute().go(context),
      child: RichText(
        text: TextSpan(
          text: '${context.s.already_have_account} ',
          style: AppTypography.h5.copyWith(color: context.colors.surface),
          children: [
            TextSpan(
              text: context.s.sign_in,
              style: AppTypography.h5.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
