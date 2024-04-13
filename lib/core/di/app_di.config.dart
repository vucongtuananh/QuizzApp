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
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../features/authentication/data/repository/auth_repository_impl.dart'
    as _i13;
import '../../features/authentication/data/source/local/auth_local_datasource.dart'
    as _i8;
import '../../features/authentication/data/source/local/auth_local_datasource_impl.dart'
    as _i9;
import '../../features/authentication/data/source/remote/auth_remote_datasource.dart'
    as _i10;
import '../../features/authentication/data/source/remote/auth_remote_datasource_impl.dart'
    as _i11;
import '../../features/authentication/domain/repository/auth_repository.dart'
    as _i12;
import '../../features/authentication/domain/usecase/get_token_usecase.dart'
    as _i14;
import '../../features/authentication/domain/usecase/login_username_usecase.dart'
    as _i16;
import '../../features/authentication/domain/usecase/logout_usecase.dart'
    as _i15;
import '../../features/authentication/domain/usecase/register_username_usecase.dart'
    as _i17;
import '../../features/authentication/presentation/login/bloc/auth_bloc.dart'
    as _i18;
import '../../main_screen/indexBnb_stream.dart' as _i4;
import '../utils/extension/screen_ui_config.dart' as _i5;
import '../utils/helpers/api/api_helper.dart' as _i7;
import 'app_dio.dart' as _i19;
import 'share_preferences.dart' as _i20;

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
  gh.singleton<_i4.IndexBnbStream>(() => _i4.IndexBnbStream());
  gh.singleton<_i5.ResponsiveUIConfig>(() => _i5.ResponsiveUIConfig());
  await gh.factoryAsync<_i6.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i7.ApiHelper>(
      () => _i7.ApiHelper(gh<_i3.Dio>(instanceName: 'appDio')));
  gh.factory<_i8.AuthLocalDataSource>(
      () => _i9.AuthLocalDatasourceImpl(gh<_i6.SharedPreferences>()));
  gh.factory<_i10.AuthRemoteDataSource>(
      () => _i11.AuthRemoteDataSourceImpl(gh<_i7.ApiHelper>()));
  gh.factory<_i12.AuthRepository>(() => _i13.AuthRepositoryImpl(
        gh<_i10.AuthRemoteDataSource>(),
        gh<_i8.AuthLocalDataSource>(),
      ));
  gh.factory<_i14.GetTokenUserUsecase>(
      () => _i14.GetTokenUserUsecase(gh<_i12.AuthRepository>()));
  gh.singleton<_i15.LogOutUsecase>(
      () => _i15.LogOutUsecase(gh<_i12.AuthRepository>()));
  gh.factory<_i16.LoginWithUserNameUsecase>(
      () => _i16.LoginWithUserNameUsecase(gh<_i12.AuthRepository>()));
  gh.factory<_i17.RegisterWithUseNameUsecase>(
      () => _i17.RegisterWithUseNameUsecase(gh<_i12.AuthRepository>()));
  gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(
        gh<_i16.LoginWithUserNameUsecase>(),
        gh<_i17.RegisterWithUseNameUsecase>(),
        gh<_i14.GetTokenUserUsecase>(),
        gh<_i15.LogOutUsecase>(),
      ));
  return getIt;
}

class _$RegisterDio extends _i19.RegisterDio {}

class _$RegisterModule extends _i20.RegisterModule {}
