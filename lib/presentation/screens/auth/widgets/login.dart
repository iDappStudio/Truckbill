import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:truckbill/presentation/router/routes/app_routes.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/utils/context_extensions.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go(AppRoutes.login);
      },
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
