import 'package:flutter/material.dart';
import 'package:islameet/presentation/widgets/islameet_form_field.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';
import 'package:islameet/presentation/widgets/islameet_outlined_button.dart';

class RegisterCard extends StatelessWidget {
  const RegisterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Регистрация',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          IslameetFormField(
            hintText: 'Электронная почта',
          ),
          SizedBox(
            height: 10,
          ),
          IslameetFormField(
            hintText: 'Пароль',
          ),
          SizedBox(
            height: 10,
          ),
          IslameetFormField(
            hintText: 'Повторите пароль',
          ),
          SizedBox(
            height: 10,
          ),
          IslameetGoldenButton(
            label: 'Продолжить',
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '───────  или  ───────',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          IslameetOutlinedButton(
            label: 'Продолжить с Google',
            icon: Icon(
              Icons.g_mobiledata_sharp,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          IslameetOutlinedButton(
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
