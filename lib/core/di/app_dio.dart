import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterDio {
  @Named('appDio')
  Dio get appDio => Dio();
}
