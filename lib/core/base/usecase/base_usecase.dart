import 'package:quizz_app/core/base/result/api_result.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUsecase<Type, Params> {
  Future<ApiResultModel<Type>> call(Params? params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
