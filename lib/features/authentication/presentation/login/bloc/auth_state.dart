import 'package:quizz_app/features/authentication/domain/entity/message_entity.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class LoginInitialState extends AuthState {
  final String username;
  final String password;

  LoginInitialState({required this.password, required this.username});
}

class LoginLoadingState extends AuthState {}

class LoginLoadedFailureState extends AuthState {
  MessageEntity messageEntity;
  LoginLoadedFailureState(this.messageEntity);
}

class LoginLoadedSuccessState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterLoadedSuccessState extends AuthState {}

class RegisterLoadedFailureState extends AuthState {
  MessageEntity messageEntity;
  RegisterLoadedFailureState(this.messageEntity);
}

class AuthCheckAlreadyLoginSucessState extends AuthState {}

class AuthCheckAlreadyLoginFailureState extends AuthState {}

class AuthCheckAlreadyLoginInitialState extends AuthState {}

class AuthLogoutSuccessState extends AuthState {}

class AuthLogoutFailureState extends AuthState {}
