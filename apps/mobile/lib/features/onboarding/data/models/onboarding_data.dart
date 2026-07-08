import 'onboarding_model.dart';

class OnboardingData {
  static const pages = [
    OnboardingModel(
      title: 'Track Every Expense',
      description:
          'Record your daily income and expenses in just a few taps.',
      image: 'assets/images/onboarding_1.png',
    ),
    OnboardingModel(
      title: 'Understand Your Money',
      description:
          'Beautiful charts and reports help you understand where your money goes.',
      image: 'assets/images/onboarding_2.png',
    ),
    OnboardingModel(
      title: 'Reach Your Financial Goals',
      description:
          'Stay organized, save more and manage your finances with confidence.',
      image: 'assets/images/onboarding_3.png',
    ),
  ];
}