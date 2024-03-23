import 'package:quizz_app/features/authentication/utils/user_data_post.dart';

abstract class AuthEvent {}

class LoginStartEvent extends AuthEvent {
  UserDataPost userDataPost;

  LoginStartEvent(this.userDataPost);
}
