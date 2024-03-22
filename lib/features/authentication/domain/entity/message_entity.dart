import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String message;
  const MessageEntity({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
