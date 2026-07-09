import 'package:flutter/material.dart';

import '../../../../core/validators/auth_validator.dart';
import '../widgets/auth_button.dart';
import '../widgets/email_text_field.dart';
import '../widgets/password_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Validation Successful'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),

                Center(
                  child: Image.asset(
                    'assets/images/splitzoo_logo.png',
                    width: 110,
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Login to continue to Splitzoo',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

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

                const SizedBox(height: 28),

                AuthButton(
                  text: 'Login',
                  onPressed: _login,
                ),

                const SizedBox(height: 18),

                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?'),
                  ),
                ),

                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Create Account'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}