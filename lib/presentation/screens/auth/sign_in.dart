import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:truckbill/presentation/assets/app_asset.dart';
import 'package:truckbill/presentation/bloc/button/login_cubit.dart';
import 'package:truckbill/presentation/bloc/button/login_state.dart';
import 'package:truckbill/presentation/screens/auth/widgets/create_account.dart';
import 'package:truckbill/presentation/screens/auth/widgets/forgot_password.dart';
import 'package:truckbill/presentation/screens/auth/widgets/header_auth.dart';
import 'package:truckbill/presentation/screens/auth/widgets/login_socials.dart';
import 'package:truckbill/presentation/screens/auth/widgets/other_options.dart';
import 'package:truckbill/presentation/screens/auth/widgets/password_field.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/theme/app_spacing.dart';
import 'package:truckbill/presentation/widgets/button/basic_button.dart';
import 'package:truckbill/utils/context_extensions.dart';

class SignInPage extends HookWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<LoginCubit>();

    useBlocListener<LoginCubit, LoginState>(cubit, (cubit, state, context) {
      if (state is LoginSuccessState) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login successful!')));
      } else if (state is LoginFailureState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
      }
    });

    final state = useBlocBuilder<LoginCubit, LoginState>(
      cubit,
      buildWhen: (state) => state is LoginLoadingState || state is LoginSuccessState || state is LoginFailureState,
    );

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body:
          state is LoginLoadingState
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
                  child: SafeArea(
                    child: Column(
                      children: [
                        HeaderAuth(mainText: context.s.sign_in, secondText: context.s.welcome_back),
                        const AppSpacing.xLarge(),
                        TextFormField(
                          decoration: InputDecoration(hintText: context.s.email),
                          controller: emailController,
                        ),
                        const AppSpacing.medium(),
                        PasswordField(hintText: context.s.password, controller: passwordController),
                        const AppSpacing.xLarge(),
                        BasicButton(
                          onPressed: () {
                            cubit.loginWithEmail(emailController.text, passwordController.text);
                          },
                          text: context.s.sign_in,
                        ),
                        const AppSpacing.small(),
                        const ForgotPasswordButton(),
                        const AppSpacing.xLarge(),
                        const CreateAccountButton(),
                        const AppSpacing.large(),
                        const OtherOptions(),
                        const AppSpacing.large(),
                        LoginSocials(
                          text: context.s.signin_google,
                          assetName: AppAssets.googleIcon,
                          onPressed: () {
                            cubit.loginWithGoogle();
                          },
                        ),
                        const AppSpacing.medium(),
                        LoginSocials(
                          text: context.s.signin_apple,
                          assetName: AppAssets.appleIcon,
                          onPressed: () {
                            cubit.loginWithApple();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
    );
  }
}
