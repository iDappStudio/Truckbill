import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:truckbill/presentation/screens/auth/forgot_password/cubit/reset_password_action.dart';
import 'package:truckbill/presentation/screens/auth/forgot_password/cubit/reset_password_cubit.dart';
import 'package:truckbill/presentation/screens/auth/forgot_password/cubit/reset_password_state.dart';
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
    final cubit = useBloc<ResetPasswordCubit>();
    final state = useBlocBuilder(cubit);

    final colors = context.colors;

    useActionListener<ResetPasswordAction>(cubit, (action) {
      switch (action) {
        case ResetPasswordSuccess():
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.s.email_send, style: AppTypography.h4.copyWith(color: Colors.white)),
              backgroundColor: colors.primary,
            ),
          );
        case ResetPasswordShowLoading():
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          );
        case ResetPasswordHideLoading():
          Navigator.of(context).pop();
        case ResetPasswordShowErrorMessage(:final message):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message, style: AppTypography.h4.copyWith(color: Colors.white)),
              backgroundColor: colors.error,
            ),
          );
      }
    });

    final emailController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: Durations.medium1,
          child: switch (state) {
            ResetPasswordInitial(:final errorMessage) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
              child: Column(
                children: [
                  AppSpacing.xLarge(),
                  HeaderAuth(mainText: context.s.reset_email, secondText: context.s.enter_email),
                  AppSpacing.xLarge(),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: context.s.email,
                      error: errorMessage != null ? SizedBox.shrink() : null,
                    ),
                    controller: emailController,
                  ),
                  AppSpacing.medium(),
                  if (errorMessage != null) Text(errorMessage, style: TextStyle(color: colors.error)),
                  AppSpacing.medium(),
                  BasicButton(
                    onPressed: () {
                      cubit.resetPassword(emailController.text);
                    },
                    text: context.s.send_link,
                  ),
                  AppSpacing.small(),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      context.s.back_to_login,
                      style: AppTypography.h5.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
                    ),
                  ),
                ],
              ),
            ),
            _ => Center(child: CircularProgressIndicator()),
          },
        ),
      ),
    );
  }
}
