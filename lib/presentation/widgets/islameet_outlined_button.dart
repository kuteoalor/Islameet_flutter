import 'package:flutter/material.dart';

class IslameetOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Icon? icon;

  const IslameetOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 45,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: const ButtonStyle(
          side: WidgetStatePropertyAll(
            BorderSide(
              color: Colors.black,
              width: 1.7,
            ),
          ),
        ),
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: icon,
      ),
    );
  }
}
