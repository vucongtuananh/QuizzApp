import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/home/mock/mock_word_model.dart';
import 'package:quizz_app/features/home/presentation/bloc/write_learn/write_learn_state.dart';

class WriteLearnCubit extends Cubit<WriteLearnState> {
  int _countTrueAnswer = 0;
  int _countAnswer = 0;
  WriteLearnCubit() : super(WriteLearnInitialState());

  int get countTrueAnswer => _countTrueAnswer;
  int get countAnswer => _countAnswer;

  void submitAnswer({
    required WordModel wordModel,
    required String answer,
    required FocusNode focusNode,
    required TextEditingController inputController,
    required BuildContext context,
    required PageController pageController,
    required List<WordModel> listWords,
  }) async {
    bool isTrue = wordModel.word.toLowerCase() == answer.trim().toLowerCase();
    if (_countAnswer < listWords.length) {
      if (answer.isNotEmpty) {
        _countAnswer++;
        if (_countAnswer == listWords.length) {
          emit(WriteLearnFinishState(countTrueAnswer: _countTrueAnswer));
        } else {
          if (isTrue && context.mounted) {
            _countTrueAnswer++;
            emit(WriteLearnTrueResultState());
            focusNode.unfocus();
            inputController.clear();
            await Future.delayed(const Duration(milliseconds: 300));
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
            await Future.delayed(const Duration(milliseconds: 300));
            // ignore: use_build_context_synchronously
            FocusScope.of(context).requestFocus(focusNode);
          }
          if (!isTrue) {
            emit(WriteLearnFalseResultState());
            focusNode.unfocus();
            inputController.clear();
            await Future.delayed(const Duration(milliseconds: 300));
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
            await Future.delayed(const Duration(milliseconds: 300));
            // ignore: use_build_context_synchronously
            FocusScope.of(context).requestFocus(focusNode);
          }
        }
      }
    }
  }
}
