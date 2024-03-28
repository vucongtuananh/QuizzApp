import 'package:equatable/equatable.dart';

class FailureModel extends Equatable {
  final String? message;
  final int? statusCode;

  const FailureModel({this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}
