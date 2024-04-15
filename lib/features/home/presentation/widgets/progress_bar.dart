import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/features/home/mock/mock_data.dart';
import 'package:quizz_app/features/home/presentation/bloc/choose_answer_bloc/progress_bar_cubit.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var progressCubit = context.read<ProgressBarCubit>();
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
                          width: constraints.maxWidth / sample_data.length * (progressCubit.state + 1),
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
                      text: "Question ${progressCubit.state + 1}/",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      children: [TextSpan(text: sample_data.length.toString(), style: TextStyle(fontSize: 20))]));
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
