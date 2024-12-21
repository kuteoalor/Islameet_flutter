import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islameet/presentation/welcome_page/auth_cubit.dart';
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
  late final TextEditingController nameController;
  late final TextEditingController surnameController;
  late final TextEditingController aboutController;
  DateTime? birthday;
  bool nameEntered = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    aboutController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    aboutController.dispose();
    super.dispose();
  }

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
          IslameetFormField(
            hintText: 'Имя*',
            controller: nameController,
            onChanged: (String value) {
              if (value.isNotEmpty && !nameEntered) {
                setState(() {
                  nameEntered = true;
                });
              } else if (value.isEmpty && nameEntered) {
                setState(() {
                  nameEntered = false;
                });
              }
            },
          )
              .animate(delay: 0.1.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 8,
          ),
          IslameetFormField(
            hintText: 'Фамилия (необязательно)',
            controller: surnameController,
          )
              .animate(delay: 0.2.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 270,
            height: 40,
            child: Card(
              color: const Color.fromRGBO(245, 245, 245, 0.3),
              shadowColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: InkWell(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now().copyWith(
                      year: DateTime.now().year - 18,
                    ),
                  );
                  if (date != null) {
                    setState(() {
                      birthday = date;
                    });
                  }
                },
                borderRadius: BorderRadius.circular(14),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                    bottom: 5,
                    top: 5,
                  ),
                  child: Row(
                    children: [
                      Text(
                        birthday == null
                            ? 'Дата рождения'
                            : DateFormat('MM.dd.yyyy').format(birthday!),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(140, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.calendar_month),
                    ],
                  ),
                ),
              ),
            ),
          )
              .animate(delay: 0.3.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 8,
          ),
          IslameetFormField(
            hintText: 'Обо мне',
            controller: aboutController,
            minLines: 6,
          )
              .animate(delay: 0.4.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 30,
          ),
          IslameetGoldenButton(
            label: 'Продолжить',
            onPressed: (birthday == null || !nameEntered)
                ? null
                : () {
                    BlocProvider.of<AuthCubit>(context).setBirthday(birthday!);
                    BlocProvider.of<AuthCubit>(context).setName(
                        '${nameController.text} ${surnameController.text}');
                    BlocProvider.of<AuthCubit>(context)
                        .setDescription(aboutController.text);
                    setState(() {
                      target = 0;
                    });
                  },
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
