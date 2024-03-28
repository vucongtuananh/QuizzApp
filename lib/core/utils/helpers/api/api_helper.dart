import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/features/authentication/utils/dto/login_dto/user_data_post.dart';
import 'package:quizz_app/features/authentication/utils/dto/register_dto/user_data_register_post.dart';
import 'package:retrofit/retrofit.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/features/authentication/data/models/login_data_model/login_data_model.dart';

part 'api_helper.g.dart';

@RestApi(baseUrl: baseUrl)
@Singleton()
abstract class ApiHelper {
  @factoryMethod
  factory ApiHelper(
    @Named('appDio') Dio dio,
  ) = _ApiHelper;

  @POST('auth/login')
  Future<HttpResponse<LoginModel?>> getLoginModel(@Body() UserDataLoginPost userDataLoginPost);
  @POST('auth/register')
  Future<HttpResponse<LoginModel?>> getRegisterModel(@Body() UserDataRegisterPost userDataLoginPost);
}
