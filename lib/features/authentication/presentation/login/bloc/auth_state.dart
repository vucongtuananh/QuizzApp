import 'package:quizz_app/features/authentication/domain/entity/message_entity.dart';

abstract class AuthState {}

class LoginInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginLoadedState extends AuthState {
  MessageEntity messageEntity;
  LoginLoadedState(this.messageEntity);
}
