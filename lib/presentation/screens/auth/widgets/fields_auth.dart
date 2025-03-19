import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';

class FieldsAuth extends StatelessWidget {
  const FieldsAuth({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
      child: TextFormField(decoration: InputDecoration(hintText: text)),
    );
  }
}
