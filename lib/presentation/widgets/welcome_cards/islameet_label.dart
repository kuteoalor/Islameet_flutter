import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islameet/presentation/utils/constants.dart';

class IslameetLabel extends StatelessWidget {
  final Function({required bool isSignIn}) onComplete;
  const IslameetLabel({
    required this.onComplete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
      )
          .animate(
            delay: 2.seconds,
            onComplete: (_) {
              onComplete(isSignIn: false);
            },
          )
          .fadeOut(delay: 1.seconds, duration: 1.seconds),
    );
  }
}
