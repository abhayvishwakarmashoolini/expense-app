import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggle;
  final String? Function(String?)? validator;

  const PasswordTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.onToggle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          onPressed: onToggle,
          icon: Icon(
            obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      ),
    );
  }
}