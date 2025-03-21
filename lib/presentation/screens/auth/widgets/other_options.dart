import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';

class OtherOptions extends StatelessWidget {
  const OtherOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: colors.surface)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.l),
              child: Text('or', style: TextStyle(color: colors.surface)),
            ),
            Expanded(child: Divider(color: colors.surface)),
          ],
        ),
      ],
    );
  }
}
