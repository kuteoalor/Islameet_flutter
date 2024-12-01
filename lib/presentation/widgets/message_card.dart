import 'package:flutter/material.dart';
import 'package:islameet/data/models/message.dart';

class MessageCard extends StatelessWidget {
  final String text;
  final String time;
  final MessageType type;
  const MessageCard({
    super.key,
    required this.text,
    required this.time,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: type == MessageType.source
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 350),
        child: Card(
          color: Colors.black.withOpacity(0.8),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 50,
                  top: 5,
                  bottom: 10,
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //  ),
    );
  }
}
