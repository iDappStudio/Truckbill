import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    return Scaffold(
      appBar: BasicAppbar(showBackButton: false),
      body: Column(
        children: [
          HeaderAuth(mainText: 'Sign in', secondText: 'Welcome back! Sign in to continue.'),
          SizedBox(height: AppDimens.xxl),
          FieldsAuth(text: 'Email'),
          SizedBox(height: AppDimens.l),
          FieldsAuth(text: 'Password'),
          SizedBox(height: AppDimens.xxl),
          BasicButton(onPressed: () {}, text: 'Sign In'),
          SizedBox(height: AppDimens.s),
          ForgotPassword(),
          SizedBox(height: AppDimens.xxl),
          CreateAccount(),
          SizedBox(height: AppDimens.xl),
          OtherOptions(),
          SizedBox(height: AppDimens.xl),
          LoginSocials(text: 'Sign in with Google', assetName: 'assets/images/google.png'),
          SizedBox(height: AppDimens.l),
          LoginSocials(text: 'Sign in with Apple', assetName: 'assets/images/apple.png'),
        ],
      ),
    );
  }
}
