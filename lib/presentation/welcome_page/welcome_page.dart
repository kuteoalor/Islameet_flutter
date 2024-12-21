import 'package:fadingpageview/fadingpageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:islameet/presentation/utils/transition_notifier.dart';
import 'package:islameet/presentation/widgets/welcome_cards/account_creation/about_card.dart';
import 'package:islameet/presentation/widgets/welcome_cards/account_creation/dedication_card.dart';
import 'package:islameet/presentation/widgets/welcome_cards/account_creation/gender_selection_card.dart';
import 'package:islameet/presentation/widgets/welcome_cards/account_creation/select_photo_card.dart';
import 'package:islameet/presentation/widgets/welcome_cards/get_acquainted.dart';
import 'package:islameet/presentation/widgets/welcome_cards/islameet_label.dart';
import 'package:islameet/presentation/widgets/welcome_cards/register_card.dart';
import 'package:islameet/presentation/widgets/welcome_cards/sign_in_card.dart';
import 'package:islameet/presentation/widgets/welcome_cards/welcome_card.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final transitionNotifier = TransitionNotifier();

  final controller = FadingPageViewController();
  int pageIndex = 0;

  void nextPage({required bool isSignIn}) {
    if (isSignIn) {
      setState(() {
        pageIndex = pageIndex + 2;
      });
    } else {
      setState(() {
        pageIndex++;
      });
    }
  }

  final pages = [
    IslameetLabel,
    WelcomeCard,
    SignInCard,
    RegisterCard,
    GetAcquaintedCard,
    GenderSelectionCard,
    AboutCard,
    SelectPhotoCard,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          AnimatedSwitcher(
            duration: 1.5.seconds,
            child: Builder(
              builder: (context) {
                switch (pages[pageIndex]) {
                  case IslameetLabel:
                    return IslameetLabel(onComplete: nextPage);
                  case WelcomeCard:
                    return WelcomeCard(nextPage: nextPage);
                  case SignInCard:
                    return SignInCard(nextPage: nextPage);
                  case RegisterCard:
                    return RegisterCard(nextPage: nextPage);
                  case GetAcquaintedCard:
                    return GetAcquaintedCard(nextPage: nextPage);
                  case GenderSelectionCard:
                    return GenderSelectionCard(nextPage: nextPage);
                  case AboutCard:
                    return AboutCard(nextPage: nextPage);
                  case SelectPhotoCard:
                    return const SelectPhotoCard();
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
