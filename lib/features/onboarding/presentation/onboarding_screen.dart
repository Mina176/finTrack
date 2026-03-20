import 'package:fynt/core/widgets/scrollable_content_with_sticky_button.dart';
import 'package:fynt/features/onboarding/data/onboarding_repository.dart';
import 'package:fynt/core/routing/app_route_enum.dart';
import 'package:fynt/core/constants/app_sizes.dart';
import 'package:fynt/features/onboarding/presentation/widgets/onboarding_page_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void completeOnboarding() async {
    await ref.read(onboardingRepositoryProvider).setOnboardingCompleted();
    if (mounted) {
      context.go(AppRoutes.signIn.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p12),
          child: ScrollableContentWithStickyButton(
            column: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: completeOnboarding,
                  child: const Text('skip'),
                ),
                const Spacer(),
                OnboardingPageSlider(
                  currentPage: currentPage,
                  pageController: _pageController,
                  onSlide: (index) => setState(() => currentPage = index),
                ),
              ],
            ),
            button: ElevatedButton(
              onPressed: () => setState(
                () => currentPage < 2
                    ? _pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.linear,
                      )
                    : completeOnboarding(),
              ),
              child: Text(currentPage < 2 ? 'Next' : 'Get Started'),
            ),
          ),
        ),
      ),
    );
  }
}
