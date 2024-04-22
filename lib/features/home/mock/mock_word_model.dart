import 'package:equatable/equatable.dart';

class WordModel extends Equatable {
  final String word;
  final String meaning;

  WordModel({required this.word, required this.meaning});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
