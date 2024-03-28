import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:quizz_app/features/authentication/domain/entity/message_entity.dart';
import 'package:quizz_app/features/authentication/utils/dto/login_dto/user_data_post.dart';
import 'package:quizz_app/features/authentication/utils/dto/register_dto/user_data_register_post.dart';

abstract class AuthRepository {
  Future<ApiResultModel<MessageEntity?>> loginWithUserName(UserDataLoginPost userDataLoginPost);
  Future<ApiResultModel<MessageEntity?>> registerWithUserName(UserDataRegisterPost userDataRegisterPost);
  Future<ApiResultModel<String?>> getTokenUser();
  Future<ApiResultModel<void>> logOut();
}
