import 'package:quizz_app/features/home/mock/mock_question_model.dart';

abstract class ChooseAnswerEvent {}

class ChooseAnswerStartEvent extends ChooseAnswerEvent {
  final int choosenIndex;
  final QuestionModel question;

  ChooseAnswerStartEvent({
    required this.choosenIndex,
    required this.question,
  });
}
