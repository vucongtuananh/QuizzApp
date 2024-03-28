import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/base/failure/failure_model.dart';
import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/core/utils/helpers/api/api_helper.dart';
import 'package:quizz_app/features/authentication/data/models/login_data_model/login_data_model.dart';
import 'package:quizz_app/features/authentication/data/source/remote/auth_remote_datasource.dart';
import 'package:quizz_app/features/authentication/utils/dto/login_dto/user_data_post.dart';
import 'package:quizz_app/features/authentication/utils/dto/register_dto/user_data_register_post.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiHelper _apiHelper;
  @factoryMethod
  AuthRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<ApiResultModel<LoginModel?>> getLoginModel(UserDataLoginPost userDataLoginPost) async {
    try {
      final response = await _apiHelper.getLoginModel(userDataLoginPost);

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

  @override
  Future<ApiResultModel<LoginModel?>> getRegisterModel(UserDataRegisterPost userDataRegisterPost) async {
    try {
      final response = await _apiHelper.getRegisterModel(userDataRegisterPost);

      if (response.response.statusCode == HttpStatus.ok) {
        return ApiResultModel.success(response.data);
      } else {
        return ApiResultModel.failure(
          FailureModel(message: response.data!.message),
        );
      }
    } on DioException catch (e) {
      var message = "";
      if (e.response != null) {
        message = emailAlreadyExist;
        return ApiResultModel.failure(
          FailureModel(message: message),
        );
      } else {
        return ApiResultModel.failure(
          FailureModel(message: e.message),
        );
      }
    }
  }
}
