import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/features/home/presentation/bloc/progress_cubit/progress_bar_cubit.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.currentLength,
    required this.length,
  });

  final int length;
  final int currentLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.grey,
                width: 3,
              ),
            ),
            child: Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return BlocBuilder<ProgressBarCubit, int>(
                      builder: (context, state) {
                        return Container(
                          width: constraints.maxWidth / length * (currentLength + 1),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: BlocBuilder<ProgressBarCubit, int>(
            builder: (context, state) {
              return RichText(
                  text: TextSpan(
                      text: "Question ${currentLength + 1}/",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      children: [TextSpan(text: length.toString(), style: TextStyle(fontSize: 20))]));
            },
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}
