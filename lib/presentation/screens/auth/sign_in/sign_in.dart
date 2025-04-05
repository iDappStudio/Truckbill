import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:truckbill/presentation/assets/app_asset.dart';
import 'package:truckbill/presentation/screens/auth/sign_in/cubit/sign_in_action.dart';
import 'package:truckbill/presentation/screens/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:truckbill/presentation/screens/auth/sign_in/cubit/sign_in_state.dart';
import 'package:truckbill/presentation/screens/auth/widgets/create_account.dart';
import 'package:truckbill/presentation/screens/auth/widgets/forgot_password.dart';
import 'package:truckbill/presentation/screens/auth/widgets/header_auth.dart';
import 'package:truckbill/presentation/screens/auth/widgets/login_socials.dart';
import 'package:truckbill/presentation/screens/auth/widgets/other_options.dart';
import 'package:truckbill/presentation/screens/auth/widgets/password_field.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/theme/app_spacing.dart';
import 'package:truckbill/presentation/theme/app_typography.dart';
import 'package:truckbill/presentation/widgets/button/basic_button.dart';
import 'package:truckbill/utils/context_extensions.dart';

class SignInPage extends HookWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SignInCubit>();
    final state = useBlocBuilder(cubit);

    final colors = context.colors;

    useActionListener<SignInAction>(cubit, (action) {
      switch (action) {
        case SignInSuccess():
          // Navigate to the home screen or dashboard
          // context.goNamed(AppRoutes.home);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login successful!', style: AppTypography.h4.copyWith(color: Colors.white)),
              backgroundColor: colors.primary,
            ),
          );
        case SignInShowLoading():
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          );
        case SignInHideLoading():
          Navigator.of(context).pop();
        case SignInShowErrorMessage(:final message):
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSwitcher(
        duration: Durations.medium1,
        child: switch (state) {
          SignInInitial(:final errorMessage) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
            child: SafeArea(
              child: Column(
                children: [
                  Spacer(),
                  HeaderAuth(mainText: context.s.sign_in, secondText: context.s.welcome_back),
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
                  const AppSpacing.small(),
                  const ForgotPasswordButton(),
                  const AppSpacing.medium(),
                  if (errorMessage != null) Text(errorMessage, style: TextStyle(color: colors.error)),
                  const AppSpacing.medium(),
                  BasicButton(
                    onPressed: () {
                      cubit.loginWithEmail(emailController.text, passwordController.text);
                    },
                    text: context.s.sign_in,
                  ),
                  const AppSpacing.small(),
                  const CreateAccountButton(),
                  const AppSpacing.large(),
                  const OtherOptions(),
                  const AppSpacing.large(),
                  LoginSocials(
                    text: context.s.signin_google,
                    assetName: AppAssets.googleIcon,
                    onPressed: cubit.loginWithGoogle,
                  ),
                  const AppSpacing.medium(),
                  LoginSocials(
                    text: context.s.signin_apple,
                    assetName: AppAssets.appleIcon,
                    onPressed: cubit.loginWithApple,
                  ),
                  Spacer(),
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
