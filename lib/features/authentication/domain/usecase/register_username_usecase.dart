import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:quizz_app/core/base/usecase/base_usecase.dart';
import 'package:quizz_app/features/authentication/domain/entity/message_entity.dart';
import 'package:quizz_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:quizz_app/features/authentication/utils/dto/register_dto/user_data_register_post.dart';

@Injectable()
class RegisterWithUseNameUsecase implements BaseUsecase<MessageEntity?, UserDataRegisterPost> {
  AuthRepository _authRepository;
  @factoryMethod
  RegisterWithUseNameUsecase(this._authRepository);

  @override
  Future<ApiResultModel<MessageEntity?>> call(UserDataRegisterPost? params) async {
    return await _authRepository.registerWithUserName(params!);
  }
}
