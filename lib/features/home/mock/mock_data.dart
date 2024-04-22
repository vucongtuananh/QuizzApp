import 'package:quizz_app/features/home/mock/mock_question_model.dart';
import 'package:quizz_app/features/home/mock/mock_word_model.dart';
import 'package:quizz_app/features/home/presentation/widgets/card_detail/card_word_details.dart';

var listCardWord = [
  ...List.generate(
    listWords.length,
    (index) => CardWordDetails(
      wordModel: listWords[index],
    ),
  )
];

final List<WordModel> listWords = [
  WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  // WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  // WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  // WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  // WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  // WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  // WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  // WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  // WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  // WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
  // WordModel(word: "Loft", meaning: 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'),
];

List<QuestionModel> sample_data = [
  QuestionModel(
      id: 1, question: 'Flutter is an open-source UI software development kit created by ______', answerIndex: 1, options: const ['Apple', 'Google', 'Facebook', 'Microsoft']),
  QuestionModel(id: 2, question: 'When google release Flutter.', answerIndex: 2, options: const ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018']),
  QuestionModel(id: 3, question: 'A memory location that holds a single letter or number.', answerIndex: 3, options: const ['Double', 'Int', 'Char', 'Word']),
  QuestionModel(id: 4, question: 'What command do you use to output data to the screen?', answerIndex: 0, options: const ['Cin', 'Count>>', 'Cout', 'Output>>']),
];
