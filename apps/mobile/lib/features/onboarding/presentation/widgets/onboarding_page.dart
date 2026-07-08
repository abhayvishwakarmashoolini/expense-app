import 'package:flutter/material.dart';

import '../../data/models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel page;

  const OnboardingPage({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(
            flex: 5,
            child: Center(
              child: Icon(
                Icons.account_balance_wallet_rounded,
                size: 150,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            page.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            page.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.grey,
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}