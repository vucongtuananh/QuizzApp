import 'package:quizz_app/features/authentication/utils/dto/login_dto/user_data_post.dart';
import 'package:quizz_app/features/authentication/utils/dto/register_dto/user_data_register_post.dart';

abstract class AuthEvent {}

class AuthStartEvent extends AuthEvent {}

class LoginStartEvent extends AuthEvent {
  UserDataLoginPost userDataLoginPost;

  LoginStartEvent(this.userDataLoginPost);
}

class LoginPrefill extends AuthEvent {
  final String usename;
  final String password;

  LoginPrefill({required this.password, required this.usename});
}

class RegisterStartEvent extends AuthEvent {
  UserDataRegisterPost userDataRegisterPost;
  RegisterStartEvent(this.userDataRegisterPost);
}

class AuthCheckAlreadyLoginEvent extends AuthEvent {}

class AuthLogoutStartEvent extends AuthEvent {}
