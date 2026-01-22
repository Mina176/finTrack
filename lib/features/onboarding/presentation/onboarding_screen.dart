import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/features/onboarding/presentation/onboarding_content.dart';
import 'package:fintrack/features/onboarding/presentation/slider_carousel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Sizes.p12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('skip'),
              Spacer(),
              OnboardingContent(
                width: 180,
                height: 180,
                title: 'Financial Freedom',
                subTitle:
                    'Track your spending, save more, and achieve financial freedom.',
                icon: FontAwesomeIcons.chartSimple,
                borderRadius: 128,
              ),
              gapH24,
              SliderIndex(
                currentPage: 0,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
