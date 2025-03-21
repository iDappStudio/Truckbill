import 'package:flutter/material.dart';

class FieldsAuth extends StatelessWidget {
  const FieldsAuth({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(decoration: InputDecoration(hintText: text));
  }
}
