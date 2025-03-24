import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';
import 'package:truckbill/utils/context_extensions.dart';

class OtherOptions extends StatelessWidget {
  const OtherOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: context.colors.surface)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.l),
              child: Text(context.s.or, style: TextStyle(color: context.colors.surface)),
            ),
            Expanded(child: Divider(color: context.colors.surface)),
          ],
        ),
      ],
    );
  }
}
