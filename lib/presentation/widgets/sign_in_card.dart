import 'package:flutter/material.dart';
import 'package:islameet/presentation/widgets/islameet_form_field.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';
import 'package:islameet/presentation/widgets/islameet_outlined_button.dart';

class SignInCard extends StatelessWidget {
  const SignInCard({super.key});

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
          ),
          const SizedBox(
            height: 20,
          ),
          const IslameetFormField(
            hintText: 'Электронная почта',
          ),
          const SizedBox(
            height: 10,
          ),
          const IslameetFormField(
            hintText: 'Пароль',
          ),
          const SizedBox(
            height: 10,
          ),
          const IslameetGoldenButton(label: 'Войти'),
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
          ),
          const SizedBox(
            height: 10,
          ),
          const IslameetOutlinedButton(
            label: 'Продолжить с Google',
            icon: Icon(
              Icons.g_mobiledata_sharp,
              color: Colors.black,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const IslameetOutlinedButton(
            label: 'Продолжить с Facebook',
            icon: Icon(
              Icons.facebook_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
