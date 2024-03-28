import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/features/authentication/data/source/local/auth_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDatasourceImpl implements AuthLocalDataSource {
  final SharedPreferences sf;

  @factoryMethod
  AuthLocalDatasourceImpl(this.sf);

  @override
  Future<void> deleteToken() async {
    await sf.remove(tokenLocal);
  }

  @override
  Future<String?> getToken() async {
    return sf.getString(tokenLocal);
  }

  @override
  Future<void> saveToken(String token) async {
    await sf.setString(tokenLocal, token);
  }
}
