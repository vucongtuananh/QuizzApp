import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:quizz_app/core/base/usecase/base_usecase.dart';
import 'package:quizz_app/features/authentication/domain/repository/auth_repository.dart';

@singleton
class LogOutUsecase implements BaseUsecase<void, NoParams> {
  final AuthRepository _authRepository;
  LogOutUsecase(this._authRepository);
  @override
  Future<ApiResultModel<void>> call(NoParams? params) async {
    final logOut = await _authRepository.logOut();
    return logOut.when(
      success: (data) {
        return ApiResultModel.success(data);
      },
      failure: (failureModel) {
        return ApiResultModel.failure(failureModel);
      },
    );
  }
}
