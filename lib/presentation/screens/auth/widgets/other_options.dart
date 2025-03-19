import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/presentation/theme/colors/light_app_color.dart';

class OtherOptions extends StatelessWidget {
  const OtherOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = LightColors();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
          child: Row(
            children: [
              Expanded(child: Divider(color: colors.surface)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimens.l),
                child: Text('or', style: TextStyle(color: colors.surface)),
              ),
              Expanded(child: Divider(color: colors.surface)),
            ],
          ),
        ),
      ],
    );
  }
}
