import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:islameet/presentation/widgets/islameet_form_field.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';
import 'package:islameet/presentation/widgets/islameet_outlined_button.dart';
import 'package:http/http.dart' as http;

class RegisterCard extends StatefulWidget {
  final Function({required bool isSignIn}) nextPage;
  const RegisterCard({super.key, required this.nextPage});

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  double target = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Регистрация',
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
          IslameetFormField(
            controller: emailController,
            hintText: 'Электронная почта',
          )
              .animate(delay: 0.2.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 10,
          ),
          IslameetFormField(
            controller: passwordController,
            hintText: 'Пароль',
          )
              .animate(delay: 0.4.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 10,
          ),
          IslameetFormField(
            hintText: 'Повторите пароль',
            controller: repeatPasswordController,
          )
              .animate(delay: 0.6.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 10,
          ),
          IslameetGoldenButton(
            onPressed: () async {
              String url = 'localhost:6100';
              final response = await http.put(Uri.http(url, '/token'),
                  headers: {
                    'content-type': 'application/json; charset=utf-8',
                  },
                  body: jsonEncode({
                    'email': 'gabela', //emailController.text,
                    'password': 'mama' //passwordController.text
                  }));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  //content: Text((jsonDecode(response.body)
                  //    as Map<String, dynamic>)['message']),
                  content: Text(response.statusCode.toString()),
                ),
              );
              setState(() {
                target = 0;
              });
            },
            label: 'Продолжить',
          )
              .animate(delay: 0.8.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 15,
          ),
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
              .animate(delay: 0.9.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 10,
          ),
          IslameetOutlinedButton(
            label: 'Продолжить с Google',
            onPressed: () => setState(() {
              target = 0;
            }),
            icon: const Icon(
              Icons.g_mobiledata_sharp,
              color: Colors.black,
              size: 30,
            ),
          )
              .animate(delay: 1.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 5,
          ),
          IslameetOutlinedButton(
            label: 'Продолжить с Facebook',
            onPressed: () => setState(() {
              target = 0;
            }),
            icon: const Icon(
              Icons.facebook_outlined,
              color: Colors.black,
            ),
          )
              .animate(
                  delay: 1.2.seconds,
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
