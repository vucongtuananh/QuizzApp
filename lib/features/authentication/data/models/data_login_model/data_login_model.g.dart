// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataLoginModel _$DataLoginModelFromJson(Map<String, dynamic> json) =>
    DataLoginModel(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      tokenExpires: json['tokenExpires'] as int?,
      user: json['user'] == null
          ? null
          : UserLoginModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataLoginModelToJson(DataLoginModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenExpires': instance.tokenExpires,
      'user': instance.user,
    };
