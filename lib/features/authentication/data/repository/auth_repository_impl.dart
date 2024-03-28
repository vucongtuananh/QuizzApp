import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/base/failure/failure_model.dart';
import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:quizz_app/features/authentication/data/source/local/auth_local_datasource.dart';
import 'package:quizz_app/features/authentication/data/source/remote/auth_remote_datasource.dart';
import 'package:quizz_app/features/authentication/domain/entity/message_entity.dart';
import 'package:quizz_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:quizz_app/features/authentication/utils/dto/login_dto/user_data_post.dart';
import 'package:quizz_app/features/authentication/utils/dto/register_dto/user_data_register_post.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  @factoryMethod
  AuthRepositoryImpl(
    this._authRemoteDataSource,
    this._authLocalDataSource,
  );

  @override
  Future<ApiResultModel<MessageEntity?>> loginWithUserName(UserDataLoginPost userDataLoginPost) async {
    final data = await _authRemoteDataSource.getLoginModel(userDataLoginPost);
    return data.when(
      success: (data) {
        _authLocalDataSource.saveToken(data!.data!.accessToken!);
        return ApiResultModel.success(MessageEntity(message: data.message!));
      },
      failure: (error) {
        return ApiResultModel.failure(error);
      },
    );
  }

  @override
  Future<ApiResultModel<MessageEntity?>> registerWithUserName(UserDataRegisterPost userDataRegisterPost) async {
    final data = await _authRemoteDataSource.getRegisterModel(userDataRegisterPost);
    return data.when(
      success: (data) {
        return ApiResultModel.success(MessageEntity(message: data!.message!));
      },
      failure: (error) {
        return ApiResultModel.failure(error);
      },
    );
  }

  @override
  Future<ApiResultModel<String?>> getTokenUser() async {
    try {
      final token = await _authLocalDataSource.getToken();
      if (token == null) {
        return ApiResultModel.success(null);
      }
      print(token);
      return ApiResultModel.success(token);
    } catch (e) {
      return ApiResultModel.failure(FailureModel(message: e.toString()));
    }
  }

  @override
  Future<ApiResultModel<void>> logOut() async {
    try {
      await _authLocalDataSource.deleteToken();
      return ApiResultModel.success(null);
    } catch (e) {
      return ApiResultModel.failure(FailureModel(message: e.toString()));
    }
  }
}
