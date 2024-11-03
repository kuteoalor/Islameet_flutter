import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:islameet/presentation/main_page/main_page.dart';
import 'package:islameet/presentation/widgets/islameet_golden_button.dart';

class SelectPhotoCard extends StatefulWidget {
  const SelectPhotoCard({super.key});

  @override
  State<SelectPhotoCard> createState() => _SelectPhotoCardState();
}

class _SelectPhotoCardState extends State<SelectPhotoCard> {
  double target = 1;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: const Color.fromARGB(255, 160, 97, 218),
                  child: const Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 193, 147, 232),
                    size: 200,
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () {},
                    hoverColor: Colors.red,
                    focusColor: Colors.amber,
                    splashColor: Colors.green,
                    //  overlayColor: const WidgetStatePropertyAll(Colors.blue),
                    highlightColor: Colors.purple,
                    onHover: (value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Hover')));
                    },
                    child: Container(
                      width: 200,
                      height: 40,
                      alignment: Alignment.center,
                      //color: const Color.fromARGB(255, 215, 188, 240),
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
          )
              .animate(delay: 0.1.seconds, target: target)
              .fadeIn(duration: 1.seconds),
          const SizedBox(
            height: 40,
          ),
          IslameetGoldenButton(
            label: 'Создать аккаунт',
            onPressed: () {
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
