import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/theme/colors/light_app_color.dart';

class LoginSocials extends StatelessWidget {
  const LoginSocials({super.key, required this.text, required this.assetName});

  final String text;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    final colors = LightColors();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.xl),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.transparent, 
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: colors.primary, 
            width: 2,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(assetName),
              SizedBox(width: AppDimens.s),
              Text(
                text, 
                style: TextStyle(
                  color: colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
