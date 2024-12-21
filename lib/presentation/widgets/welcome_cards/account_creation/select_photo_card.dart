import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islameet/presentation/main_page/main_page.dart';
import 'package:islameet/presentation/welcome_page/auth_cubit.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';

class SelectPhotoCard extends StatefulWidget {
  const SelectPhotoCard({super.key});

  @override
  State<SelectPhotoCard> createState() => _SelectPhotoCardState();
}

class _SelectPhotoCardState extends State<SelectPhotoCard> {
  double target = 1;
  Image? image;
  String? imageEncoded;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Добавьте свое\nфото',
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
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: Container(
                color: const Color.fromARGB(255, 160, 97, 218),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: image == null
                          ? const Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 193, 147, 232),
                              size: 200,
                            )
                          : SizedBox(height: 300, child: image),
                    ),
                    Material(
                      color: const Color.fromARGB(255, 215, 188, 240),
                      child: InkWell(
                        onTap: () async {
                          final picker = ImagePicker();
                          final pickedImage = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (pickedImage != null) {
                            final bytes = await pickedImage.readAsBytes();
                            final base64img = base64Encode(bytes);
                            setState(() {
                              image = Image.memory(
                                bytes,
                                fit: BoxFit.fitHeight,
                              );
                              imageEncoded = base64img;
                            });
                          }
                        },
                        child: Container(
                          width: image == null ? 200 : null,
                          height: 40,
                          alignment: Alignment.center,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.upload_file),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Загрузить фото'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
              .animate(delay: 0.1.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 40,
          ),
          IslameetGoldenButton(
            label: 'Создать аккаунт',
            onPressed: image == null
                ? null
                : () {
                    BlocProvider.of<AuthCubit>(context)
                        .setPhotoURL(imageEncoded!);
                    BlocProvider.of<AuthCubit>(context).setPrefs();
                    BlocProvider.of<AuthCubit>(context).sendUserInfo();
                    setState(() {
                      target = 0;
                    });
                  },
          )
              .animate(
                delay: 0.3.seconds,
                target: target,
                onComplete: (_) {
                  if (target == 0) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    );
                  }
                },
              )
              .fadeIn(duration: 1.seconds),
        ],
      ),
    );
  }
}
