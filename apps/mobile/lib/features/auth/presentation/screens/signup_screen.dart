import 'package:flutter/material.dart';

import '../../../../core/validators/auth_validator.dart';

import '../widgets/auth_button.dart';
import '../widgets/email_text_field.dart';
import '../widgets/name_text_field.dart';
import '../widgets/password_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm your password';
    }

    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }

    return null;
  }

  void _signup() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account Created Successfully'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),

                Center(
                  child: Image.asset(
                    'assets/images/splitzoo_logo.png',
                    width: 110,
                  ),
                ),

                const SizedBox(height: 30),

                NameTextField(
                  controller: _nameController,
                  validator: AuthValidator.validateName,
                ),

                const SizedBox(height: 18),

                EmailTextField(
                  controller: _emailController,
                  validator: AuthValidator.validateEmail,
                ),

                const SizedBox(height: 18),

                PasswordTextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  onToggle: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  validator: AuthValidator.validatePassword,
                ),

                const SizedBox(height: 18),

                PasswordTextField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  onToggle: () {
                    setState(() {
                      _obscureConfirmPassword =
                          !_obscureConfirmPassword;
                    });
                  },
                  validator: _confirmPasswordValidator,
                ),

                const SizedBox(height: 30),

                AuthButton(
                  text: 'Create Account',
                  onPressed: _signup,
                ),

                const SizedBox(height: 15),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Already have an account? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}