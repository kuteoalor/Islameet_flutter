import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:islameet/presentation/utils/constants.dart';

class IslameetGoldenButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const IslameetGoldenButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 45,
      child: GradientElevatedButton(
        onPressed: onPressed,
        style: GradientElevatedButton.styleFrom(
          gradient: gradient,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
