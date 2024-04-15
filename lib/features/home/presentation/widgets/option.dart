import 'package:flutter/material.dart';
import 'package:quizz_app/core/constant/color_value.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.size,
    required this.option,
    required this.onTap,
  });

  final String option;
  final Size size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.only(bottom: 20),
        width: size.width,
        decoration: BoxDecoration(
            border: Border.all(
          color: mainColor,
          width: 2,
        )),
        child: Text(
          option,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
