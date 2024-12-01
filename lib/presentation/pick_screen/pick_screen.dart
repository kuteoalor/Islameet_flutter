import 'package:flutter/material.dart';
import 'package:islameet/presentation/widgets/pick_action_buttons.dart';

class PickScreen extends StatelessWidget {
  const PickScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage('images/valeria.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 100,
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Валерия, 20',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Учусь на ФПМИ БГУ, изучаю ТП и очень\nлюблю аббревиатуры!!!',
                            style: TextStyle(
                              height: 1.2,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PickActionButtons(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.height * 0.48,
            ),
          ],
        ),
      ),
    );
  }
}
