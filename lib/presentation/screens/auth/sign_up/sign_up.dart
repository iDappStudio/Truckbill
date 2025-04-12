import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:truckbill/presentation/screens/auth/sign_up/cubit/sign_up_action.dart';
import 'package:truckbill/presentation/screens/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:truckbill/presentation/screens/auth/sign_up/cubit/sign_up_state.dart';
import 'package:truckbill/presentation/screens/auth/widgets/header_auth.dart';
import 'package:truckbill/presentation/screens/auth/widgets/login_button.dart';
import 'package:truckbill/presentation/screens/auth/widgets/password_field.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/theme/app_spacing.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/presentation/widgets/button/basic_button.dart';
import 'package:truckbill/utils/context_extensions.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SignUpCubit>();
    final state = useBlocBuilder(cubit);

    final colors = context.colors;

    useActionListener<SignUpAction>(cubit, (action) {
      switch (action) {
        case SignUpSuccess():
          //context.go(AppRoutes.home);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.s.register_successful, style: AppTypography.h4.copyWith(color: Colors.white)),
              backgroundColor: colors.primary,
            ),
          );
        case SignUpShowLoading():
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          );
        case SignUpHideLoading():
          Navigator.of(context).pop();
        case SignUpShowErrorMessage(:final message):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message, style: AppTypography.h4.copyWith(color: Colors.white)),
              backgroundColor: colors.error,
            ),
          );
      }
    });

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSwitcher(
        duration: Durations.medium1,
        child: switch (state) {
          SignUpInitial(:final errorMessage) => Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.xl),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),
                  Icon(Icons.fire_truck_rounded),
                  Spacer(),
                  HeaderAuth(mainText: context.s.create_account, secondText: context.s.joins_us),
                  const AppSpacing.xLarge(),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: context.s.email,
                      error: errorMessage != null ? SizedBox.shrink() : null,
                    ),
                    controller: emailController,
                  ),
                  const AppSpacing.medium(),
                  PasswordField(
                    hintText: context.s.password,
                    controller: passwordController,
                    hasError: errorMessage != null,
                  ),
                  const AppSpacing.medium(),
                  PasswordField(
                    hintText: context.s.confirm_password,
                    controller: confirmPasswordController,
                    hasError: errorMessage != null,
                  ),
                  const AppSpacing.medium(),
                  if (errorMessage != null) Text(errorMessage, style: TextStyle(color: colors.error)),
                  const AppSpacing.medium(),
                  BasicButton(
                    onPressed: () {
                      cubit.signUpWithEmail(
                        emailController.text,
                        passwordController.text,
                        confirmPasswordController.text,
                      );
                    },
                    text: context.s.sign_up,
                  ),
                  const AppSpacing.medium(),
                  LoginButton(),
                  const AppSpacing.small(),
                ],
              ),
            ),
          ),
          _ => Center(child: CircularProgressIndicator()),
        },
      ),
    );
  }
}
