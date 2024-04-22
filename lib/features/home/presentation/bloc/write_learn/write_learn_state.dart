abstract class WriteLearnState {}

class WriteLearnInitialState extends WriteLearnState {}

class WriteLearnTrueResultState extends WriteLearnState {}

class WriteLearnFalseResultState extends WriteLearnState {}

class WriteLearnFinishState extends WriteLearnState {
  final int countTrueAnswer;

  WriteLearnFinishState({required this.countTrueAnswer});
}
