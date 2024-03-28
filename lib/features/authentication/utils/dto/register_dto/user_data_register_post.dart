import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data_register_post.g.dart';

@JsonSerializable()
class UserDataRegisterPost {
  final String name;
  final String email;
  final String password;
  final String username;

  UserDataRegisterPost(this.password, this.username, this.email, this.name);

  Map<String, dynamic> toJson() => _$UserDataRegisterPostToJson(this);
}
