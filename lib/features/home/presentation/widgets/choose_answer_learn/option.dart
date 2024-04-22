import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/home/presentation/bloc/choose_answer_bloc/choose_answer_bloc.dart';
import 'package:quizz_app/features/home/presentation/bloc/choose_answer_bloc/choose_answer_state.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.size,
    required this.option,
    required this.onTap,
    required this.index,
  });

  final int index;
  final String option;
  final Size size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var chooseAnswerBloc = context.read<ChooseAnswerBloc>();
    Color getColor(ChooseAnswerState state) {
      if (chooseAnswerBloc.isAnswer) {
        if (state is ChooseAnswerShowResultState) {
          if (index == state.correctIndex) {
            return Colors.green;
          } else if (index == state.selectedIndex) {
            return Colors.red;
          } else
            // ignore: curly_braces_in_flow_control_structures
            return Colors.grey;
        }
      }

      return Colors.grey;
    }

    Widget showDotResult(ChooseAnswerState state) {
      if (chooseAnswerBloc.isAnswer) {
        if (state is ChooseAnswerShowResultState) {
          if (index == state.correctIndex) {
            return Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: Colors.green,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            );
          } else if (index == state.selectedIndex) {
            return Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: Colors.red,
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            );
          } else {
            return Container();
          }
        }
      }
      return Container();
    }

    return InkWell(
      onTap: onTap,
      child: BlocBuilder<ChooseAnswerBloc, ChooseAnswerState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin: const EdgeInsets.only(bottom: 20),
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: getColor(state),
                  width: 2,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  option,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                showDotResult(state)
              ],
            ),
          );
        },
      ),
    );
  }
}
