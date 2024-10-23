import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:islameet/presentation/widgets/islameet_form_field.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';
import 'package:islameet/presentation/widgets/islameet_outlined_button.dart';

class SignInCard extends StatefulWidget {
  final Function({required bool isSignIn}) nextPage;
  const SignInCard({super.key, required this.nextPage});

  @override
  State<SignInCard> createState() => _SignInCardState();
}

class _SignInCardState extends State<SignInCard> {
  double target = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Вход',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          )
              .animate(delay: 0.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 20,
          ),
          const IslameetFormField(
            hintText: 'Электронная почта',
          )
              .animate(delay: 0.3.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 10,
          ),
          const IslameetFormField(
            hintText: 'Пароль',
          )
              .animate(delay: 0.5.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 10,
          ),
          IslameetGoldenButton(
            label: 'Войти',
            onPressed: () {
              setState(() => target = 0);
              //widget.nextPage(isSignIn: true);
            },
          )
              .animate(delay: 0.7.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 15,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Забыли пароль?',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          )
              .animate(delay: 0.9.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 5,
          ),
          const Text(
            '───────  или  ───────',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
              .animate(delay: 1.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 10,
          ),
          IslameetOutlinedButton(
            label: 'Продолжить с Google',
            onPressed: () {
              setState(() => target = 0);
              //widget.nextPage(isSignIn: true);
            },
            icon: const Icon(
              Icons.g_mobiledata_sharp,
              color: Colors.black,
              size: 30,
            ),
          )
              .animate(delay: 1.1.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 5,
          ),
          IslameetOutlinedButton(
            label: 'Продолжить с Facebook',
            onPressed: () {
              setState(() => target = 0);
            },
            icon: const Icon(
              Icons.facebook_outlined,
              color: Colors.black,
            ),
          )
              .animate(
                delay: 1.3.seconds,
                target: target,
                onComplete: (_) {
                  if (target == 0) {
                    widget.nextPage(isSignIn: true);
                  }
                },
              )
              .fadeIn(duration: 1.seconds),
        ],
      ),
    );
  }
}
