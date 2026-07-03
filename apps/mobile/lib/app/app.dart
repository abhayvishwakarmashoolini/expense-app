import 'package:flutter/material.dart';

import '../core/routes/app_routes.dart';
import '../core/theme/app_theme.dart';
import '../features/splash/presentation/screens/splash_screen.dart';

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      theme: AppTheme.lightTheme,

      // App ka first screen
      initialRoute: AppRoutes.splash,

      // Saare routes yaha register honge
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
      },
    );
  }
}