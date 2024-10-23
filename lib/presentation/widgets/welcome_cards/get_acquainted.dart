import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';

class GetAcquaintedCard extends StatefulWidget {
  final Function({required bool isSignIn}) nextPage;
  const GetAcquaintedCard({super.key, required this.nextPage});

  @override
  State<GetAcquaintedCard> createState() => _GetAcquaintedCardState();
}

class _GetAcquaintedCardState extends State<GetAcquaintedCard> {
  double target = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Создана учетная запись',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          )
              .animate(delay: 0.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          const Text(
            'Давайте\nзнакомиться!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              height: 1.2,
              fontWeight: FontWeight.w600,
            ),
          )
              .animate(delay: 0.2.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 40,
          ),
          IslameetGoldenButton(
            label: 'Создать аккаунт',
            onPressed: () {
              setState(() => target = 0);
              //widget.nextPage(isSignIn: false);
            },
          )
              .animate(
                  delay: 0.3.seconds,
                  target: target,
                  onComplete: (_) {
                    print('gege');
                    if (target == 0) {
                      print('be');
                      widget.nextPage(isSignIn: false);
                    }
                  })
              .fadeIn(duration: 1.seconds),
        ],
      ),
    );
  }
}
