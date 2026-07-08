import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/local_storage_service.dart';

import '../../data/models/onboarding_data.dart';

import '../widgets/next_button.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {

  final PageController _pageController =
      PageController();

  int _currentPage = 0;

  bool get _isLastPage =>
      _currentPage ==
      OnboardingData.pages.length - 1;

  Future<void> _nextPage() async {

    if (_isLastPage) {

      await LocalStorageService
          .setOnboardingCompleted();

      if (!mounted) return;

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.login,
      );

      return;
    }

    _pageController.nextPage(
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.easeInOut,
    );
  }

  void _skip() {

    _pageController.animateToPage(
      OnboardingData.pages.length - 1,
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {

    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Column(

          children: [

            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  right: 16,
                ),
                child: SkipButton(
                  onPressed: _skip,
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount:
                    OnboardingData.pages.length,
                onPageChanged: (index) {

                  setState(() {

                    _currentPage = index;

                  });

                },
                itemBuilder: (_, index) {

                  return OnboardingPage(
                    page:
                        OnboardingData.pages[index],
                  );

                },
              ),
            ),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: List.generate(
                OnboardingData.pages.length,
                (index) =>
                    OnboardingIndicator(
                  active:
                      index == _currentPage,
                ),
              ),
            ),

            const SizedBox(height: 32),

            Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: NextButton(
                onPressed: _nextPage,
                isLastPage: _isLastPage,
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}