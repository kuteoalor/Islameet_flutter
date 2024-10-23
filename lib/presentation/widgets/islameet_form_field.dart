import 'package:flutter/material.dart';

class IslameetFormField extends StatelessWidget {
  final String hintText;
  final int? minLines;
  const IslameetFormField({
    super.key,
    required this.hintText,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 40 + (minLines ?? 0) * 15,
      child: Card(
        color: const Color.fromRGBO(245, 245, 245, 0.3),
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            bottom: 10,
            //vertical: 1,
          ),
          child: TextFormField(
            minLines: minLines,
            maxLines: 10,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              fillColor: Colors.red,
              focusColor: Colors.red,
              hoverColor: Colors.red,
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: const TextStyle(
                color: Color.fromARGB(140, 0, 0, 0),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
