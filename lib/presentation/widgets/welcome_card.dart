import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';
import 'package:islameet/presentation/widgets/islameet_outlined_button.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Добро\nпожаловать в',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ).animate(delay: 2.seconds).fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 20,
          ),
          const IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Text(
                    'Islameet',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                  width: 50,
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    'сервис для знакомства \nи общения',
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ).animate(delay: 2.3.seconds).fadeIn(
                duration: 1.2.seconds,
              ),
          const SizedBox(
            height: 40,
          ),
          const IslameetGoldenButton(
            label: 'Войти',
          ).animate(delay: 2.5.seconds).fadeIn(
                duration: 1.3.seconds,
              ),
          const SizedBox(
            height: 10,
          ),
          const IslameetOutlinedButton(
            label: 'Создать аккаунт',
          ).animate(delay: 2.6.seconds).fadeIn(
                duration: 1.2.seconds,
              ),
        ],
      ),
    );
  }
}
