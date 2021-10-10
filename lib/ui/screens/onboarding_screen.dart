import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wonderful_indonesia/provider/onboarding_provider.dart';

final List<PageViewModel> onboardingPages = <PageViewModel>[
  PageViewModel(
    title: 'Resik',
    body: '1',
    footer: const Text('1'),
  ),
  PageViewModel(
    title: 'Resik',
    body: '2',
    footer: const Text('2'),
  ),
  PageViewModel(
    title: 'Resik',
    body: '3',
    footer: const Text('3'),
  ),
];

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingProvider onboardingProvider =
        Provider.of<OnboardingProvider>(
      context,
      listen: false,
    );

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: onboardingPages,
          showNextButton: true,
          showSkipButton: true,
          skip: const Text('Skip'),
          next: const Text('Next'),
          done: const Text('Enter'),
          onDone: () {
            onboardingProvider.haveOnboarding();
          },
        ),
      ),
    );
  }
}
