import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordField extends HookWidget {
  const PasswordField({
    required this.hintText,
    required this.controller,
    this.obscureText = true,
    this.hasError = false,
    super.key,
  });

  final String hintText;
  final bool obscureText;
  final bool hasError;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final isObscure = useState(obscureText);

    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        error: hasError ? SizedBox.shrink() : null,
        suffixIcon: IconButton(
          onPressed: () => isObscure.value = !isObscure.value,
          icon: Icon(isObscure.value ? Icons.visibility_off : Icons.visibility),
        ),
      ),
      obscureText: isObscure.value,
    );
  }
}
