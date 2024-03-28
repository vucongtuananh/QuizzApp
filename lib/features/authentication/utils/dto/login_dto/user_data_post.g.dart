// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataLoginPost _$UserDataLoginPostFromJson(Map<String, dynamic> json) =>
    UserDataLoginPost(
      json['password'] as String,
      json['username'] as String,
    );

Map<String, dynamic> _$UserDataLoginPostToJson(UserDataLoginPost instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
