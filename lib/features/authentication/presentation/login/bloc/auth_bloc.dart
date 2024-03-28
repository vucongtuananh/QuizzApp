import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/base/usecase/base_usecase.dart';
import 'package:quizz_app/features/authentication/domain/entity/message_entity.dart';
import 'package:quizz_app/features/authentication/domain/usecase/get_token_usecase.dart';
import 'package:quizz_app/features/authentication/domain/usecase/login_username_usecase.dart';
import 'package:quizz_app/features/authentication/domain/usecase/logout_usecase.dart';
import 'package:quizz_app/features/authentication/domain/usecase/register_username_usecase.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_event.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginWithUserNameUsecase _loginWithUserNameUsecase;
  final RegisterWithUseNameUsecase _registerWithUseNameUsecase;
  final GetTokenUserUsecase _getTokenUserUsecase;
  final LogOutUsecase _logOutUsecase;
  @factoryMethod
  AuthBloc(
    this._loginWithUserNameUsecase,
    this._registerWithUseNameUsecase,
    this._getTokenUserUsecase,
    this._logOutUsecase,
  ) : super(AuthInitialState()) {
    on<LoginStartEvent>(_loginStartEvent);
    on<RegisterStartEvent>(_registerStartEvent);
    on<AuthStartEvent>(_authStartEvent);
    on<LoginPrefill>(_loginPrefill);
    on<AuthCheckAlreadyLoginEvent>(_authCheckAlreadyLoginEvent);
    on<AuthLogoutStartEvent>(_authLogoutStartEvent);
  }

  FutureOr<void> _loginStartEvent(LoginStartEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    final message = await _loginWithUserNameUsecase(event.userDataLoginPost);
    await Future.delayed(const Duration(seconds: 2));
    message.when(
        success: (data) {
          emit(LoginLoadedSuccessState());
        },
        failure: (failure) => emit(LoginLoadedFailureState(MessageEntity(message: failure.message!))));
  }

  FutureOr<void> _registerStartEvent(RegisterStartEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    final message = await _registerWithUseNameUsecase(event.userDataRegisterPost);
    await Future.delayed(const Duration(seconds: 2));
    message.when(
      success: (data) {
        emit(
          RegisterLoadedSuccessState(),
        );
      },
      failure: (failureModel) {
        emit(
          RegisterLoadedFailureState(
            MessageEntity(
              message: failureModel.message!,
            ),
          ),
        );
      },
    );
  }

  FutureOr<void> _authStartEvent(AuthStartEvent event, Emitter<AuthState> emit) {
    emit(AuthCheckAlreadyLoginInitialState());
  }

  FutureOr<void> _loginPrefill(LoginPrefill event, Emitter<AuthState> emit) {
    emit(LoginInitialState(password: event.password, username: event.usename));
  }

  FutureOr<void> _authCheckAlreadyLoginEvent(AuthCheckAlreadyLoginEvent event, Emitter<AuthState> emit) async {
    final token = await _getTokenUserUsecase.call(NoParams());

    token.when(
      success: (data) {
        if (data == null) {
          emit(AuthCheckAlreadyLoginInitialState());
        } else {
          emit(AuthCheckAlreadyLoginSucessState());
        }
      },
      failure: (failure) => emit(
        AuthCheckAlreadyLoginFailureState(),
      ),
    );
  }

  FutureOr<void> _authLogoutStartEvent(AuthLogoutStartEvent event, Emitter<AuthState> emit) async {
    final logOut = await _logOutUsecase(NoParams());

    logOut.when(
      success: (data) => emit(AuthLogoutSuccessState()),
      failure: (failureModel) => emit(AuthLogoutFailureState()),
    );
  }
}
