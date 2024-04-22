abstract class ChooseAnswerState {}

class ChooseAnswerInitialState extends ChooseAnswerState {}

class ChooseAnswerTrueState extends ChooseAnswerState {}

class ChooseAnswerFalseState extends ChooseAnswerState {}

class ChooseAnswerShowResultState extends ChooseAnswerState {
  final int correctIndex;
  final int selectedIndex;

  ChooseAnswerShowResultState({
    required this.correctIndex,
    required this.selectedIndex,
  });
}

class ChooseAnswerConclusionState extends ChooseAnswerState {}
