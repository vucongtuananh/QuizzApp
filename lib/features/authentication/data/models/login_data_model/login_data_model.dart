import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quizz_app/features/authentication/data/models/data_login_model/data_login_model.dart';
import 'package:quizz_app/features/authentication/data/models/error_login_model/error_login_model.dart';

part 'login_data_model.g.dart';

@JsonSerializable()
class LoginModel extends Equatable {
  final DataLoginModel? data;
  final int? status;
  final String? message;
  @JsonKey(name: 'errors')
  final ErrorLoginModel? errorModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  LoginModel(
    this.status, {
    this.data,
    this.message,
    this.errorModel,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        data,
        status,
        message,
        errorModel,
      ];
}
