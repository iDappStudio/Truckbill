import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:truckbill/presentation/router/routes/app_routes.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
   final colors = Theme.of(context).colorScheme; 
    return GestureDetector(
      onTap: () => context.go(AppRoutes.createAccount),
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