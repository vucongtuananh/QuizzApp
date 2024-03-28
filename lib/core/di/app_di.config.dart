// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../features/authentication/data/repository/auth_repository_impl.dart'
    as _i12;
import '../../features/authentication/data/source/local/auth_local_datasource.dart'
    as _i7;
import '../../features/authentication/data/source/local/auth_local_datasource_impl.dart'
    as _i8;
import '../../features/authentication/data/source/remote/auth_remote_datasource.dart'
    as _i9;
import '../../features/authentication/data/source/remote/auth_remote_datasource_impl.dart'
    as _i10;
import '../../features/authentication/domain/repository/auth_repository.dart'
    as _i11;
import '../../features/authentication/domain/usecase/get_token_usecase.dart'
    as _i13;
import '../../features/authentication/domain/usecase/login_username_usecase.dart'
    as _i15;
import '../../features/authentication/domain/usecase/logout_usecase.dart'
    as _i14;
import '../../features/authentication/domain/usecase/register_username_usecase.dart'
    as _i16;
import '../../features/authentication/presentation/login/bloc/auth_bloc.dart'
    as _i17;
import '../utils/extension/screen_ui_config.dart' as _i4;
import '../utils/helpers/api/api_helper.dart' as _i6;
import 'app_dio.dart' as _i18;
import 'share_preferences.dart' as _i19;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerDio = _$RegisterDio();
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(
    () => registerDio.appDio,
    instanceName: 'appDio',
  );
  gh.singleton<_i4.ResponsiveUIConfig>(() => _i4.ResponsiveUIConfig());
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i6.ApiHelper>(
      () => _i6.ApiHelper(gh<_i3.Dio>(instanceName: 'appDio')));
  gh.factory<_i7.AuthLocalDataSource>(
      () => _i8.AuthLocalDatasourceImpl(gh<_i5.SharedPreferences>()));
  gh.factory<_i9.AuthRemoteDataSource>(
      () => _i10.AuthRemoteDataSourceImpl(gh<_i6.ApiHelper>()));
  gh.factory<_i11.AuthRepository>(() => _i12.AuthRepositoryImpl(
        gh<_i9.AuthRemoteDataSource>(),
        gh<_i7.AuthLocalDataSource>(),
      ));
  gh.factory<_i13.GetTokenUserUsecase>(
      () => _i13.GetTokenUserUsecase(gh<_i11.AuthRepository>()));
  gh.singleton<_i14.LogOutUsecase>(
      () => _i14.LogOutUsecase(gh<_i11.AuthRepository>()));
  gh.factory<_i15.LoginWithUserNameUsecase>(
      () => _i15.LoginWithUserNameUsecase(gh<_i11.AuthRepository>()));
  gh.factory<_i16.RegisterWithUseNameUsecase>(
      () => _i16.RegisterWithUseNameUsecase(gh<_i11.AuthRepository>()));
  gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(
        gh<_i15.LoginWithUserNameUsecase>(),
        gh<_i16.RegisterWithUseNameUsecase>(),
        gh<_i13.GetTokenUserUsecase>(),
        gh<_i14.LogOutUsecase>(),
      ));
  return getIt;
}

class _$RegisterDio extends _i18.RegisterDio {}

class _$RegisterModule extends _i19.RegisterModule {}
