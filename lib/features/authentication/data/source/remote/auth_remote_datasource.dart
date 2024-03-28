import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:quizz_app/features/authentication/data/models/login_data_model/login_data_model.dart';
import 'package:quizz_app/features/authentication/utils/dto/login_dto/user_data_post.dart';
import 'package:quizz_app/features/authentication/utils/dto/register_dto/user_data_register_post.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResultModel<LoginModel?>> getLoginModel(UserDataLoginPost userDataLoginPost);
  Future<ApiResultModel<LoginModel?>> getRegisterModel(UserDataRegisterPost userDataRegisterPost);
}
