import 'package:equatable/equatable.dart';

class QuestionModel extends Equatable {
  final int id, answerIndex;
  final String question;
  final List<String> options;

  QuestionModel({required this.id, required this.question, required this.answerIndex, required this.options});
  @override
  List<Object?> get props => [id, answerIndex, question, options];
}
