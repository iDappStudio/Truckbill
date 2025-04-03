import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:truckbill/presentation/screens/auth/widgets/header_auth.dart';
import 'package:truckbill/presentation/screens/auth/widgets/login.dart';
import 'package:truckbill/presentation/screens/auth/widgets/password_field.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/theme/app_spacing.dart';
import 'package:truckbill/presentation/widgets/button/basic_button.dart';
import 'package:truckbill/utils/context_extensions.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
     final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.xl),
          child: SafeArea(
            child: Column(
              children: [
                HeaderAuth(mainText: context.s.create_account, secondText: context.s.joins_us),
                const AppSpacing.xLarge(),
                TextFormField(decoration: InputDecoration(hintText: context.s.email), controller: emailController,),
                const AppSpacing.medium(),
                PasswordField(hintText: context.s.password, controller: passwordController,),
                const AppSpacing.medium(),
                PasswordField(hintText: context.s.confirm_password, controller: passwordController,),
                const AppSpacing.xLarge(),
                BasicButton(onPressed: () {}, text: context.s.sign_up),
                const AppSpacing.xLarge(),
                LoginButton(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
