import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:truckbill/generated/l10n.dart';
import 'package:truckbill/presentation/assets/app_asset.dart';
import 'package:truckbill/presentation/screens/auth/widgets/create_account.dart';
import 'package:truckbill/presentation/screens/auth/widgets/fields_auth.dart';
import 'package:truckbill/presentation/screens/auth/widgets/forgot_password.dart';
import 'package:truckbill/presentation/screens/auth/widgets/header_auth.dart';
import 'package:truckbill/presentation/screens/auth/widgets/login_socials.dart';
import 'package:truckbill/presentation/screens/auth/widgets/other_options.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/widgets/appbar/basic_appbar.dart';
import 'package:truckbill/presentation/widgets/button/basic_button.dart';


class SignInPage extends HookWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: BasicAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
          child: Column(
            children: [
              HeaderAuth(mainText: s.sign_in, secondText: s.welcome_back),
              SizedBox(height: AppDimens.xxl),
              FieldsAuth(text: s.email),
              SizedBox(height: AppDimens.l),
              FieldsAuth(text: s.password),
              SizedBox(height: AppDimens.xxl),
              BasicButton(onPressed: () {}, text: s.sign_in),
              SizedBox(height: AppDimens.s),
              ForgotPassword(),
              SizedBox(height: AppDimens.xxl),
              CreateAccount(),
              SizedBox(height: AppDimens.xl),
              OtherOptions(),
              SizedBox(height: AppDimens.xl),
              LoginSocials(text: s.signin_google, assetName: AppAssets.googleIcon),
              SizedBox(height: AppDimens.l),
              LoginSocials(text: s.signin_apple, assetName: AppAssets.appleIcon),
            ],
          ),
        ),
      ),
    );
  }
}
