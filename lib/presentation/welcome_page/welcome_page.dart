import 'package:flutter/material.dart';
import 'package:islameet/presentation/widgets/islameet_form_field.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';
import 'package:islameet/presentation/widgets/islameet_label.dart';
import 'package:islameet/presentation/widgets/islameet_outlined_button.dart';
import 'package:islameet/presentation/widgets/register_card.dart';
import 'package:islameet/presentation/widgets/sign_in_card.dart';
import 'package:islameet/presentation/widgets/welcome_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          IslameetLabel(),
          WelcomeCard(),
          //SignInCard(),
          //RegisterCard(),
        ],
      ),
    );
  }
}
