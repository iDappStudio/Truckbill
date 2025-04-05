import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:truckbill/presentation/screens/auth/widgets/header_auth.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/theme/app_spacing.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/presentation/widgets/button/basic_button.dart';
import 'package:truckbill/utils/context_extensions.dart';

class ForgotPasswordPage extends HookWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
          child: Column(
            children: [
              AppSpacing.xLarge(),
              HeaderAuth(mainText: context.s.reset_email, secondText: context.s.enter_email),
              AppSpacing.xLarge(),
              TextFormField(decoration: InputDecoration(hintText: context.s.email)),
              AppSpacing.large(),
              BasicButton(onPressed: () {}, text: context.s.send_link),
              AppSpacing.small(),
              TextButton(
                onPressed: () => context.pop(),
                child: Text(
                  'Wróć do logowania',
                  style: AppTypography.h5.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
