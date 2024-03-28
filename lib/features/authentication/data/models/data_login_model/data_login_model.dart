import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quizz_app/features/authentication/data/models/user_login_model/user_login_model.dart';

part 'data_login_model.g.dart';

@JsonSerializable()
class DataLoginModel {
  final String? accessToken;
  final String? refreshToken;
  final int? tokenExpires;
  @JsonKey(name: 'user')
  final UserLoginModel? user;

  factory DataLoginModel.fromJson(Map<String, dynamic> json) => _$DataLoginModelFromJson(json);

  DataLoginModel({
    this.accessToken,
    this.refreshToken,
    this.tokenExpires,
    this.user,
  });
}
