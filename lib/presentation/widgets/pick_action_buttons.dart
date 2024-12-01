import 'package:flutter/material.dart';

class PickActionButtons extends StatelessWidget {
  final double height;
  final double width;
  const PickActionButtons({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          const Positioned(
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 35,
              child: Icon(
                size: 40,
                Icons.undo_rounded,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: width - 70,
            child: const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.black,
              child: Icon(
                size: 40,
                Icons.star_rounded,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: height * 0.25,
            left: width * 0.14,
            child: const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.black,
              child: Icon(
                size: 70,
                Icons.close_rounded,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: height * 0.25,
            right: width * 0.14,
            child: const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.black,
              child: Icon(
                size: 70,
                Icons.favorite,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
