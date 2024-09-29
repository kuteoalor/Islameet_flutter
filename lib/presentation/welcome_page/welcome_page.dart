import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islameet/presentation/utils/constants.dart';
import 'package:islameet/presentation/widgets/welcome_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: ShaderMask(
              shaderCallback: (bounds) {
                return gradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                );
              },
              child: Text(
                'Islameet',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 80,
                    color: Colors.transparent,
                    shadows: [
                      const BoxShadow(
                        color: Colors.white,
                        spreadRadius: 5,
                        offset: Offset(1, 1),
                      ),
                    ]),
              ),
            ).animate().fadeOut(delay: 1.seconds, duration: 1.seconds),
          ),
          const WelcomeCard(gradient: gradient),
        ],
      ),
    );
  }
}
