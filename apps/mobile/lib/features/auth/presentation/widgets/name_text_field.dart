import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const NameTextField({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'Full Name',
        hintText: 'Enter your full name',
        prefixIcon: Icon(Icons.person_outline),
      ),
    );
  }
}