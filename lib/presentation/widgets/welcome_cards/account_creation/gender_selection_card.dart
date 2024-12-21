import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islameet/presentation/welcome_page/auth_cubit.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';

class GenderSelectionCard extends StatefulWidget {
  final Function({required bool isSignIn}) nextPage;
  const GenderSelectionCard({super.key, required this.nextPage});

  @override
  State<GenderSelectionCard> createState() => _GenderSelectionCardState();
}

class _GenderSelectionCardState extends State<GenderSelectionCard> {
  double target = 1;
  int selectedIndex = -1;

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

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
          GenderButtons(
            target: target,
            indexChanged: changeIndex,
          ),
          const SizedBox(
            height: 20,
          ),
          IslameetGoldenButton(
            label: 'Продолжить',
            onPressed: selectedIndex == -1
                ? null
                : () {
                    setState(() {
                      target = 0;
                    });
                    BlocProvider.of<AuthCubit>(context)
                        .setGender(selectedIndex == 1);
                  },
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

class GenderButtons extends StatefulWidget {
  final Function(int) indexChanged;
  const GenderButtons({
    super.key,
    required this.target,
    required this.indexChanged,
  });

  final double target;

  @override
  State<GenderButtons> createState() => _GenderButtonsState();
}

class _GenderButtonsState extends State<GenderButtons> {
  final unselectedColor = const Color.fromRGBO(245, 245, 245, 0.3);
  final selectedColor = const Color.fromRGBO(245, 245, 245, 0.5);
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: selectedIndex == 0 ? selectedColor : unselectedColor,
          shadowColor: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              widget.indexChanged(0);
              setState(() {
                selectedIndex = 0;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                border: Border.all(
                  width: 2,
                  color: unselectedColor.withOpacity(
                    selectedIndex == 0 ? 0.4 : 0,
                  ),
                ),
              ),
              child: const Padding(
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
            ),
          ),
        )
            .animate(delay: 0.2.seconds, target: widget.target)
            .fadeIn(duration: 1.seconds),
        const SizedBox(
          width: 5,
        ),
        Card(
          color: selectedIndex == 1 ? selectedColor : unselectedColor,
          shadowColor: Colors.transparent,
          child: InkWell(
            onTap: () {
              widget.indexChanged(1);
              setState(() {
                selectedIndex = 1;
              });
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                border: Border.all(
                  width: 2,
                  color: unselectedColor.withOpacity(
                    selectedIndex == 1 ? 0.4 : 0,
                  ),
                ),
              ),
              child: const Padding(
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
            ),
          ),
        )
            .animate(delay: 0.3.seconds, target: widget.target)
            .fadeIn(duration: 1.seconds),
      ],
    );
  }
}
