import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/home/mock/mock_data.dart';
import 'package:quizz_app/features/home/presentation/bloc/choose_answer_bloc/choose_answer_event.dart';
import 'package:quizz_app/features/home/presentation/bloc/choose_answer_bloc/choose_answer_state.dart';

class ChooseAnswerBloc extends Bloc<ChooseAnswerEvent, ChooseAnswerState> {
  bool _isAnswer = false;
  final PageController _pageController = PageController(initialPage: 0);
  int _countPageChosen = 0;
  int _countTrueAnswer = 0;
  bool get isAnswer => _isAnswer;
  PageController get pageController => _pageController;
  int get countPageChosen => _countPageChosen;
  int get countTrueAnswer => _countTrueAnswer;

  ChooseAnswerBloc() : super(ChooseAnswerInitialState()) {
    on<ChooseAnswerStartEvent>(_chooseAnswerStartEvent);
  }

  FutureOr<void> _chooseAnswerStartEvent(ChooseAnswerStartEvent event, Emitter<ChooseAnswerState> emit) async {
    _isAnswer = true;
    _countPageChosen++;
    int choosenIndex = event.choosenIndex;
    int correctIndex = event.question.answerIndex;

    // if (choosenIndex == correctIndex) {
    //   emit(ChooseAnswerTrueState());
    // } else {
    //   emit(ChooseAnswerFalseState());
    // }
    emit(ChooseAnswerShowResultState(
      correctIndex: correctIndex,
      selectedIndex: choosenIndex,
    ));
    if (choosenIndex == correctIndex) _countTrueAnswer++;
    await Future.delayed(const Duration(seconds: 1));
    _isAnswer = false;
    _pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.ease);
    if (_countPageChosen == sample_data.length) {
      emit(ChooseAnswerConclusionState());
    }
  }
}
