import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:truckbill/presentation/assets/app_asset.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
          child: SafeArea(
            child: Column(
              children: [
                HeaderAuth(mainText: context.s.sign_in, secondText: context.s.welcome_back),
                const AppSpacing.xLarge(),
                TextFormField(decoration: InputDecoration(hintText: context.s.email)),
                const AppSpacing.medium(),
                PasswordField(hintText: context.s.password),
                const AppSpacing.xLarge(),
                BasicButton(onPressed: () {}, text: context.s.sign_in),
                const AppSpacing.small(),
                const ForgotPasswordButton(),
                const AppSpacing.xLarge(),
                const CreateAccountButton(),
                const AppSpacing.large(),
                const OtherOptions(),
                const AppSpacing.large(),
                LoginSocials(text: context.s.signin_google, assetName: AppAssets.googleIcon, onPressed: () {}),
                const AppSpacing.medium(),
                LoginSocials(text: context.s.signin_apple, assetName: AppAssets.appleIcon, onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
