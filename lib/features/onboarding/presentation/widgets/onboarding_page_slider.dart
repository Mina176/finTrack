import 'package:fynt/features/onboarding/presentation/widgets/onboarding_card.dart';
import 'package:fynt/features/onboarding/presentation/widgets/slider_index.dart';
import 'package:fynt/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnboardingPageSlider extends StatelessWidget {
  const OnboardingPageSlider({
    super.key,
    required this.onSlide,
    required this.currentPage,
    required this.pageController,
  });

  final void Function(int)? onSlide;
  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PageView(
            onPageChanged: onSlide,
            controller: pageController,
            children: [
              OnboardingCard(
                width: 180,
                height: 180,
                title: context.l10n.onboardingTitleFreedom,
                subTitle: context.l10n.onboardingSubtitleFreedom,
                icon: FontAwesomeIcons.chartSimple,
                borderRadius: 128,
              ),
              OnboardingCard(
                width: 180,
                height: 180,
                title: context.l10n.onboardingTitleSmartCategorization,
                subTitle: context.l10n.onboardingSubtitleSmartCategorization,
                icon: FontAwesomeIcons.chartPie,
                borderRadius: 32,
              ),
              OnboardingCard(
                width: 180,
                height: 180,
                title: context.l10n.onboardingTitleBudgetMaster,
                subTitle: context.l10n.onboardingSubtitleBudgetMaster,
                icon: Icons.account_balance_wallet_rounded,
                borderRadius: 32,
              ),
            ],
          ),
        ),
        SliderIndex(
          currentPage: currentPage,
        ),
      ],
    );
  }
}
