// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quizz_app/core/base/failure/failure_model.dart';
part 'api_result.freezed.dart';

@freezed
class ApiResultModel<T> with _$ApiResultModel<T> {
  factory ApiResultModel.success(T data) = Success<T>;
  factory ApiResultModel.failure(FailureModel failureModel) = Failure<T>;
}
