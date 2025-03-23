import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:truckbill/presentation/router/routes/app_routes.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/utils/context_extensions.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => context.push(AppRoutes.forgotPassword),
        child: Text(
          context.s.forgot_password,
          style: AppTypography.h5.copyWith(fontWeight: FontWeight.bold, color: context.colors.error),
        ),
      ),
    );
  }
}
