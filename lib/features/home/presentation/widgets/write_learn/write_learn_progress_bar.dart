import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/features/home/presentation/bloc/progress_cubit/progress_bar_cubit.dart';

class WriteLearnProgressBar extends StatelessWidget {
  const WriteLearnProgressBar({
    super.key,
    required this.currentLength,
    required this.length,
  });

  final int length;
  final int currentLength;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.grey,
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
        ));
  }
}
