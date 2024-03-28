import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:quizz_app/core/base/usecase/base_usecase.dart';
import 'package:quizz_app/features/authentication/domain/repository/auth_repository.dart';

@Injectable()
class GetTokenUserUsecase implements BaseUsecase<String?, NoParams> {
  AuthRepository _authRepository;
  GetTokenUserUsecase(this._authRepository);
  @override
  Future<ApiResultModel<String?>> call(NoParams? params) async {
    final token = await _authRepository.getTokenUser();
    return token.when(
      success: (data) {
        return ApiResultModel.success(data);
      },
      failure: (failureModel) => ApiResultModel.failure(failureModel),
    );
  }
}
