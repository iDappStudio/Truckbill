import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:truckbill/presentation/router/routes/app_routes.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(right: AppDimens.l),
      child: TextButton(
        onPressed: () => context.push(AppRoutes.forgotPassword),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot Password?',
            style: AppTypography.h5.copyWith(fontWeight: FontWeight.bold, color: colors.error),
          ),
        ),
      ),
    );
  }
}