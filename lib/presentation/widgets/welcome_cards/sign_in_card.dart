import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islameet/presentation/main_page/main_page.dart';
import 'package:islameet/presentation/welcome_page/auth_cubit.dart';
import 'package:islameet/presentation/widgets/islameet_form_field.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';
import 'package:islameet/presentation/widgets/islameet_outlined_button.dart';
import 'package:http/http.dart' as http;

class SignInCard extends StatefulWidget {
  final Function({required bool isSignIn}) nextPage;
  const SignInCard({super.key, required this.nextPage});

  @override
  State<SignInCard> createState() => _SignInCardState();
}

class _SignInCardState extends State<SignInCard> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
          IslameetFormField(
            controller: emailController,
            hintText: 'Электронная почта',
          )
              .animate(delay: 0.3.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 10,
          ),
          IslameetFormField(
            controller: passwordController,
            hintText: 'Пароль',
            isObscured: true,
          )
              .animate(delay: 0.5.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 10,
          ),
          IslameetGoldenButton(
            label: 'Войти',
            onPressed: () async {
              String url = 'localhost:6100';
              final response = await http.post(Uri.http(url, '/token'),
                  headers: {
                    'content-type': 'application/json; charset=utf-8',
                  },
                  body: jsonEncode({
                    'email': emailController.text, //emailController.text,
                    'password':
                        passwordController.text, //passwordController.text
                  }));
              final body = json.decode(response.body) as Map<String, dynamic>;
              print(body['data']);
              int id = body['data']['id'];
              print(id);
              BlocProvider.of<AuthCubit>(context).setId(id);
              BlocProvider.of<AuthCubit>(context).setPrefs();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(response.statusCode.toString()),
                ),
              );
              setState(() => target = 0);
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    );
                    //widget.nextPage(isSignIn: true);
                  }
                },
              )
              .fadeIn(duration: 1.seconds),
        ],
      ),
    );
  }
}
