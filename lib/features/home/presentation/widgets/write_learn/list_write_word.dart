import 'package:flutter/material.dart';
import 'package:quizz_app/features/home/mock/mock_word_model.dart';

class WriteWord extends StatelessWidget {
  const WriteWord({super.key, required this.size, required this.writeWord});

  final Size size;

  final WordModel writeWord;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height * 0.8,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Text(
              writeWord.meaning,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
            ),
          ),
        ));
  }
}
