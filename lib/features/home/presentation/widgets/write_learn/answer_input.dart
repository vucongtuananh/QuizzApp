import 'package:flutter/material.dart';
import 'package:quizz_app/core/constant/color_value.dart';

class AnswerInput extends StatelessWidget {
  const AnswerInput({
    super.key,
    required this.controller,
    required this.onFieldSubmitted,
    required this.focusNode,
  });

  final TextEditingController controller;
  final void Function(String value)? onFieldSubmitted;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      padding: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border(
            bottom: BorderSide(
              color: mainColor,
              width: 2,
            ),
          )),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              autofocus: true,
              focusNode: focusNode,
              controller: controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Type the answer",
              ),
              onFieldSubmitted: onFieldSubmitted,
            ),
          ),
          InkWell(
            splashColor: mainColor,
            onTap: () {},
            child: Text(
              "Check it",
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
