import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';

class GenderSelectionCard extends StatefulWidget {
  final Function({required bool isSignIn}) nextPage;
  const GenderSelectionCard({super.key, required this.nextPage});

  @override
  State<GenderSelectionCard> createState() => _GenderSelectionCardState();
}

class _GenderSelectionCardState extends State<GenderSelectionCard> {
  double target = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Укажите\nсвой пол',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          )
              .animate(delay: 0.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Card(
                color: Color.fromRGBO(245, 245, 245, 0.3),
                shadowColor: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.female,
                        size: 60,
                      ),
                      Text('Я женщина'),
                    ],
                  ),
                ),
              )
                  .animate(delay: 0.2.seconds, target: target)
                  .fadeIn(duration: 1.seconds),
              const SizedBox(
                width: 5,
              ),
              const Card(
                color: Color.fromRGBO(245, 245, 245, 0.3),
                shadowColor: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.male,
                        size: 60,
                      ),
                      Text('Я мужчина'),
                    ],
                  ),
                ),
              )
                  .animate(delay: 0.3.seconds, target: target)
                  .fadeIn(duration: 1.seconds),
            ],
          ),
          const SizedBox(
            height: 20,
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
                  })
              .fadeIn(duration: 1.seconds),
        ],
      ),
    );
  }
}
