import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:truckbill/presentation/assets/app_asset.dart';
import 'package:truckbill/presentation/screens/auth/widgets/create_account.dart';
import 'package:truckbill/presentation/screens/auth/widgets/forgot_password.dart';
import 'package:truckbill/presentation/screens/auth/widgets/header_auth.dart';
import 'package:truckbill/presentation/screens/auth/widgets/login_socials.dart';
import 'package:truckbill/presentation/screens/auth/widgets/other_options.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/widgets/appbar/basic_appbar.dart';
import 'package:truckbill/presentation/widgets/button/basic_button.dart';
import 'package:truckbill/utils/context_extensions.dart';

class SignIn extends HookWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    return Scaffold(
      appBar: BasicAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
          child: Column(
            children: [
              HeaderAuth(mainText: s.sign_in, secondText: s.welcome_back),
              const SizedBox(height: AppDimens.xxl),
              TextFormField(decoration: InputDecoration(hintText: s.email)),
              const SizedBox(height: AppDimens.l),
              TextFormField(decoration: InputDecoration(hintText: s.password)),
              const SizedBox(height: AppDimens.xxl),
              BasicButton(onPressed: () {}, text: s.sign_in),
              const SizedBox(height: AppDimens.s),
              const ForgotPassword(),
              const SizedBox(height: AppDimens.xxl),
              const CreateAccount(),
              const SizedBox(height: AppDimens.xl),
              const OtherOptions(),
              const SizedBox(height: AppDimens.xl),
              LoginSocials(text: s.signin_google, assetName: AppAssets.googleIcon),
              const SizedBox(height: AppDimens.l),
              LoginSocials(text: s.signin_apple, assetName: AppAssets.appleIcon),
            ],
          ),
        ),
      ),
    );
  }
}
