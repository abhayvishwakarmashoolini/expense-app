import 'package:flutter/material.dart';

class OnboardingIndicator extends StatelessWidget {
  final bool isActive;

  const OnboardingIndicator({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: isActive ? 28 : 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}