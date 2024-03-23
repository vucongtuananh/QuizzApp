import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_login_model.g.dart';

@JsonSerializable()
class UserLoginModel {
  final String? id;
  final String? username;
  final String? name;
  final String? avatar;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => _$UserLoginModelFromJson(json);

  UserLoginModel({
    this.id,
    this.username,
    this.name,
    this.avatar,
    this.createdAt,
    this.updatedAt,
  });
}
