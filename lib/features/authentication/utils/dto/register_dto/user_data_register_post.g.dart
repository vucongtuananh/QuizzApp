// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_register_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataRegisterPost _$UserDataRegisterPostFromJson(
        Map<String, dynamic> json) =>
    UserDataRegisterPost(
      json['password'] as String,
      json['username'] as String,
      json['email'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$UserDataRegisterPostToJson(
        UserDataRegisterPost instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
    };
