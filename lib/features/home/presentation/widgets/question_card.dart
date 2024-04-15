import 'package:flutter/material.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/features/home/mock/mock_question_model.dart';
import 'package:quizz_app/features/home/presentation/widgets/option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.size,
    required this.question,
  });

  final QuestionModel question;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.16),
          blurRadius: 6,
          spreadRadius: 0,
          offset: Offset(
            0,
            3,
          ),
        ),
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.23),
          blurRadius: 6,
          spreadRadius: 0,
          offset: Offset(
            0,
            3,
          ),
        ),
      ]),
      child: Column(
        children: [
          Text(
            question.question,
            style: const TextStyle(
              color: mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ...List.generate(
                question.options.length,
                (index) => Option(
                  size: size,
                  option: question.options[index],
                  onTap: () {
                    if (question.answerIndex == index) {
                      print("true");
                    } else {
                      print("false");
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
