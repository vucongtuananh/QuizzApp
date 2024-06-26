import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:quizz_app/core/base/usecase/base_usecase.dart';
import 'package:quizz_app/features/authentication/domain/entity/message_entity.dart';
import 'package:quizz_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:quizz_app/features/authentication/utils/dto/login_dto/user_data_post.dart';

@Injectable()
class LoginWithUserNameUsecase implements BaseUsecase<MessageEntity?, UserDataLoginPost> {
  AuthRepository _authRepository;
  @factoryMethod
  LoginWithUserNameUsecase(this._authRepository);

  @override
  Future<ApiResultModel<MessageEntity?>> call(UserDataLoginPost? params) async {
    return await _authRepository.loginWithUserName(params!);
  }
}
