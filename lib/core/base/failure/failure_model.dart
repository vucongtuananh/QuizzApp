import 'package:equatable/equatable.dart';

class FailureModel extends Equatable {
  final String? message;
  final int? statusCode;

  FailureModel({this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message, statusCode];
}
