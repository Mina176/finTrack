import 'package:fintrack/constants/app_colors.dart';
import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/features/onboarding/presentation/onboarding_page_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: gradientColors,
          ),
          child: Padding(
            padding: EdgeInsets.all(Sizes.p12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => context.go('/home'),
                  child: Text('skip'),
                ),
                Spacer(),
                OnboardingPageSlider(
                  currentPage: currentPage,
                  pageController: _pageController,
                  onSlide: (index) => setState(() {
                    currentPage = index;
                  }),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () => setState(() {
                    currentPage < 2
                        ? _pageController.nextPage(
                            duration: Duration(milliseconds: 250),
                            curve: Curves.linear,
                          )
                        : context.go('/home');
                  }),
                  child: currentPage < 2
                      ? Text('Next')
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Get Started  '),
                            Icon(
                              Icons.arrow_forward_rounded,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
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
