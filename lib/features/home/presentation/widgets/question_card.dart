import 'package:flutter/material.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/features/home/presentation/widgets/option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.5,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Định nghĩa",
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                "Home",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Option(size: size),
              const SizedBox(
                height: 10,
              ),
              Option(size: size),
              const SizedBox(
                height: 10,
              ),
              Option(size: size),
              const SizedBox(
                height: 10,
              ),
              Option(size: size),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
