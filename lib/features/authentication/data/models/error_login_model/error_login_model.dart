import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'error_login_model.g.dart';

@JsonSerializable()
class ErrorLoginModel extends Equatable {
  final String? email;
  final String? password;

  factory ErrorLoginModel.fromJson(Map<String, dynamic> json) => _$ErrorLoginModelFromJson(json);

  const ErrorLoginModel({
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
