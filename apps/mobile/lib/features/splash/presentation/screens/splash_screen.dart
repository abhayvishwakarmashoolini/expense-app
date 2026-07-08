import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/local_storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startApp();
  }

  Future<void> _startApp() async {
    await Future.delayed(const Duration(seconds: 2));

    final completed =
        await LocalStorageService.isOnboardingCompleted();

    if (!mounted) return;

    if (completed) {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.login,
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.onboarding,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}