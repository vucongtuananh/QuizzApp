import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:quizz_app/features/authentication/data/source/remote/login_remote_datasource.dart';
import 'package:quizz_app/features/authentication/domain/entity/message_entity.dart';
import 'package:quizz_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:quizz_app/features/authentication/utils/user_data_post.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;
  @factoryMethod
  AuthRepositoryImpl(this._loginRemoteDataSource);

  @override
  Future<ApiResultModel<MessageEntity?>> loginWithUserName(UserDataPost userDataPost) async {
    final data = await _loginRemoteDataSource.getLoginModel(userDataPost);
    return data.when(
      success: (data) {
        if (data!.status! <= 200) {
          return ApiResultModel.success(MessageEntity(message: data.message!));
        } else {
          return ApiResultModel.success(MessageEntity(message: data.errorModel!.password ?? data.errorModel!.email!));
        }
      },
      failure: (error) {
        return ApiResultModel.failure(error);
      },
    );
  }
}
