import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data_post.g.dart';

@JsonSerializable()
class UserDataPost {
  final String username;
  final String password;

  UserDataPost(this.password, this.username);

  Map<String, dynamic> toJson() => _$UserDataPostToJson(this);
}
