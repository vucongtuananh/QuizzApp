// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataPost _$UserDataPostFromJson(Map<String, dynamic> json) => UserDataPost(
      json['password'] as String,
      json['username'] as String,
    );

Map<String, dynamic> _$UserDataPostToJson(UserDataPost instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
