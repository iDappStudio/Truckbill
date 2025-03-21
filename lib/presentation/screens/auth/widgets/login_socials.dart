import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginSocials extends StatelessWidget {
  const LoginSocials({super.key, required this.text, required this.assetName});

  final String text;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextButton.icon(
        onPressed: () {},
        icon: SvgPicture.asset(assetName, height: 20),
        label: Text(
          text,
          style: TextStyle(
            color: colors.primary,
            fontSize: 16,
          ),
        ),
        style: TextButton.styleFrom(
          minimumSize: Size(double.infinity, 60),
          side: BorderSide(color: colors.primary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
