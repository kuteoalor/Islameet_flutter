import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';

class DedicationCard extends StatefulWidget {
  final Function({required bool isSignIn}) nextPage;
  const DedicationCard({super.key, required this.nextPage});

  @override
  State<DedicationCard> createState() => _DedicationCardState();
}

class _DedicationCardState extends State<DedicationCard> {
  double target = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Что вы ищете?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          )
              .animate(delay: 0.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Покажем людей с такой же целью.\nМожно позже изменить в\nнастройках профиля',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          )
              .animate(delay: 0.2.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 270,
            child: const Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              color: Color.fromRGBO(245, 245, 245, 0.3),
              shadowColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Серьезные отношения',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
                .animate(delay: 0.1.seconds, target: target)
                .fadeIn(duration: 1.seconds),
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
            width: 270,
            child: const Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              color: Color.fromRGBO(245, 245, 245, 0.3),
              shadowColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Дружеское общение',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
                .animate(delay: 0.2.seconds, target: target)
                .fadeIn(duration: 1.seconds),
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
            width: 270,
            child: const Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              color: Color.fromRGBO(245, 245, 245, 0.3),
              shadowColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Решу, когда встречу',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
                .animate(delay: 0.3.seconds, target: target)
                .fadeIn(duration: 1.seconds),
          ),
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
                delay: 0.5.seconds,
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
