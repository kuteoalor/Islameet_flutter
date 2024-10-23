import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:islameet/presentation/widgets/islameet_form_field.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';

class AboutCard extends StatefulWidget {
  final Function({required bool isSignIn}) nextPage;
  const AboutCard({super.key, required this.nextPage});

  @override
  State<AboutCard> createState() => _AboutCardState();
}

class _AboutCardState extends State<AboutCard> {
  double target = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Расскажите\nнемного о себе',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          )
              .animate(delay: 0.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 30,
          ),
          const IslameetFormField(
            hintText: 'Имя',
          )
              .animate(delay: 0.1.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 8,
          ),
          const IslameetFormField(
            hintText: 'Фамилия (необязательно)',
          )
              .animate(delay: 0.2.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 8,
          ),
          const IslameetFormField(
            hintText: 'Дата рождения',
          )
              .animate(delay: 0.3.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 8,
          ),
          const IslameetFormField(
            hintText: 'Обо мне',
            minLines: 4,
          )
              .animate(delay: 0.4.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 30,
          ),
          IslameetGoldenButton(
            label: 'Продолжить',
            onPressed: () => setState(() {
              target = 0;
            }),
          )
              .animate(
                delay: 0.6.seconds,
                target: target,
                onComplete: (_) {
                  if (target == 0) {
                    widget.nextPage(isSignIn: false);
                  }
                },
              )
              .fadeIn(duration: 1.seconds),
        ],
      ),
    );
  }
}
