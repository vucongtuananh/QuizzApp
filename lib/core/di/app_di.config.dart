// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:quizz_app/core/utils/helpers/api/api_helper.dart' as _i3;
import 'package:quizz_app/features/authentication/data/repository/auth_repository_impl.dart'
    as _i8;
import 'package:quizz_app/features/authentication/data/source/remote/login_remote_datasource.dart'
    as _i5;
import 'package:quizz_app/features/authentication/data/source/remote/login_remote_datasource_impl.dart'
    as _i6;
import 'package:quizz_app/features/authentication/domain/repository/auth_repository.dart'
    as _i7;
import 'package:quizz_app/features/authentication/domain/usecase/login_username_usecase.dart'
    as _i9;
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_bloc.dart'
    as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiHelper>(() => _i3.ApiHelper(gh<_i4.Dio>()));
    gh.singleton<_i5.LoginRemoteDataSource>(
        () => _i6.LoginRemoteDataSourceImpl(gh<_i3.ApiHelper>()));
    gh.singleton<_i7.AuthRepository>(
        () => _i8.AuthRepositoryImpl(gh<_i5.LoginRemoteDataSource>()));
    gh.singleton<_i9.LoginWithUserNameUsecase>(
        () => _i9.LoginWithUserNameUsecase(gh<_i7.AuthRepository>()));
    gh.factory<_i10.AuthBloc>(
        () => _i10.AuthBloc(gh<_i9.LoginWithUserNameUsecase>()));
    return this;
  }
}
