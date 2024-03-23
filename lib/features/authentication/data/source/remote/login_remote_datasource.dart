import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:quizz_app/features/authentication/data/models/login_data_model/login_data_model.dart';
import 'package:quizz_app/features/authentication/utils/user_data_post.dart';

abstract class LoginRemoteDataSource {
  Future<ApiResultModel<LoginModel?>> getLoginModel(UserDataPost userDataPost);
}
