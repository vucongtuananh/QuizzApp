import 'package:flutter/material.dart';
import 'package:quizz_app/core/constant/color_value.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: size.width,
      decoration: BoxDecoration(
          border: Border.all(
        color: mainColor,
        width: 2,
      )),
      child: const Text(
        "Ngôi nhà",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
