import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({
    super.key,
    required this.gradient,
  });

  final LinearGradient gradient;

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
          SizedBox(
            width: 270,
            height: 45,
            child: GradientElevatedButton(
              onPressed: () {},
              style: GradientElevatedButton.styleFrom(
                gradient: gradient,
              ),
              child: const Text(
                'Войти',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ).animate(delay: 2.5.seconds).fadeIn(
                duration: 1.3.seconds,
              ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 270,
            height: 45,
            child: OutlinedButton(
              onPressed: () {},
              style: const ButtonStyle(
                side: WidgetStatePropertyAll(
                  BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
              ),
              child: const Text(
                'Создать аккаунт',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ).animate(delay: 2.6.seconds).fadeIn(
                duration: 1.2.seconds,
              ),
        ],
      ),
    );
  }
}
