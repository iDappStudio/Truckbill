import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:truckbill/presentation/router/routes/app_routes.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/utils/context_extensions.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    final colors = context.colors;

    return GestureDetector(
      onTap: () => context.go(AppRoutes.createAccount),
      child: RichText(
        text: TextSpan(
          text: '${s.dont_have_account} ',
          style: AppTypography.h5.copyWith(color: colors.surface),
          children: [
            TextSpan(
              text: s.sign_up,
              style: AppTypography.h5.copyWith(fontWeight: FontWeight.bold, color: colors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
