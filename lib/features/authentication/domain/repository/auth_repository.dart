import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:quizz_app/features/authentication/domain/entity/message_entity.dart';
import 'package:quizz_app/features/authentication/utils/user_data_post.dart';

abstract class AuthRepository {
  Future<ApiResultModel<MessageEntity?>> loginWithUserName(UserDataPost userDataPost);
}
