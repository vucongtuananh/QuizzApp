import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/base/failure/failure_model.dart';
import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/core/utils/helpers/api/api_helper.dart';
import 'package:quizz_app/features/authentication/data/models/login_data_model/login_data_model.dart';
import 'package:quizz_app/features/authentication/data/source/remote/login_remote_datasource.dart';
import 'package:quizz_app/features/authentication/utils/user_data_post.dart';

@Singleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiHelper _apiHelper;
  @factoryMethod
  LoginRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<ApiResultModel<LoginModel?>> getLoginModel(UserDataPost userDataPost) async {
    try {
      final response = await _apiHelper.getLoginModel(userDataPost);

      if (response.response.statusCode == HttpStatus.ok) {
        return ApiResultModel.success(response.data);
      } else {
        return ApiResultModel.failure(
          FailureModel(message: response.data!.message),
        );
      }
    } on DioException catch (e) {
      final emailError = e.response!.data['errors']['email'];
      final passwordError = e.response!.data['errors']['password'];
      var message = "";
      if (emailError == null) {
        message = passwordFailure;
      }
      if (passwordError == null) {
        message = useNameNotFound;
      }
      return ApiResultModel.failure(
        FailureModel(message: message),
      );
    }
  }
}
