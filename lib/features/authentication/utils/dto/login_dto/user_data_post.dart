import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data_post.g.dart';

@JsonSerializable()
class UserDataLoginPost {
  final String username;
  final String password;

  UserDataLoginPost(this.password, this.username);

  Map<String, dynamic> toJson() => _$UserDataLoginPostToJson(this);
}
