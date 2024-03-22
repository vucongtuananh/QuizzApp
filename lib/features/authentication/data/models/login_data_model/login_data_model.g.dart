// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      json['status'] as int?,
      data: json['data'] == null
          ? null
          : DataLoginModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      errorModel: json['errors'] == null
          ? null
          : ErrorLoginModel.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errorModel,
    };
