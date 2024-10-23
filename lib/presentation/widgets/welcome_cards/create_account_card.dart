import 'package:flutter/material.dart';
import 'package:islameet/presentation/widgets/islameet_form_field.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';
import 'package:islameet/presentation/widgets/islameet_outlined_button.dart';

class CreateAccountCard extends StatelessWidget {
  const CreateAccountCard({super.key});

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
          const IslameetFormField(
            hintText: 'Повторите пароль',
          ),
          const SizedBox(
            height: 10,
          ),
          IslameetGoldenButton(
            onPressed: () {},
            label: 'Продолжить',
          ),
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
          ),
          const SizedBox(
            height: 10,
          ),
          IslameetOutlinedButton(
            label: 'Продолжить с Google',
            onPressed: () {},
            icon: const Icon(
              Icons.g_mobiledata_sharp,
              color: Colors.black,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          IslameetOutlinedButton(
            onPressed: () {},
            label: 'Продолжить с Facebook',
            icon: const Icon(
              Icons.facebook_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
