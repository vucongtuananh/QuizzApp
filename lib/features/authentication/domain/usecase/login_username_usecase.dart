import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:quizz_app/core/base/usecase/base_usecase.dart';
import 'package:quizz_app/features/authentication/domain/entity/message_entity.dart';
import 'package:quizz_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:quizz_app/features/authentication/utils/user_data_post.dart';

@Singleton()
class LoginWithUserNameUsecase extends BaseUsecase<MessageEntity?, UserDataPost> {
  AuthRepository _authRepository;
  @factoryMethod
  LoginWithUserNameUsecase(this._authRepository);

  @override
  Future<ApiResultModel<MessageEntity?>> call(UserDataPost? params) async {
    return await _authRepository.loginWithUserName(params!);
  }
}
