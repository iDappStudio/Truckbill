import 'package:flutter/material.dart';
import 'package:truckbill/presentation/router/app_router.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/utils/context_extensions.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => ForgotPasswordRoute().push(context),
        child: Text(
          context.s.forgot_password,
          style: AppTypography.h5.copyWith(fontWeight: FontWeight.bold, color: context.colors.error),
        ),
      ),
    );
  }
}
