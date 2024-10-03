import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class IslameetFormField extends StatelessWidget {
  final String hintText;
  const IslameetFormField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 270,
      height: 40,
      borderRadius: 14,
      blur: 70,
      alignment: Alignment.bottomCenter,
      border: 0,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.1),
          Color(0xFFFFFFFF).withOpacity(0.05),
        ],
        stops: const [
          0.1,
          1,
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.5),
          Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          bottom: 15,
          //vertical: 1,
        ),
        child: TextFormField(
          style: const TextStyle(
            fontSize: 13,
          ),
          decoration: InputDecoration(
            fillColor: Colors.red,
            focusColor: Colors.red,
            hoverColor: Colors.red,
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(
              color: Color.fromARGB(76, 0, 0, 0),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
