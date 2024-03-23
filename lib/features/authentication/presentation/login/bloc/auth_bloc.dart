import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/features/authentication/domain/entity/message_entity.dart';
import 'package:quizz_app/features/authentication/domain/usecase/login_username_usecase.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_event.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginWithUserNameUsecase _loginWithUserNameUsecase;

  AuthBloc(this._loginWithUserNameUsecase) : super(LoginInitialState()) {
    on<LoginStartEvent>(_loginStartEvent);
  }

  FutureOr<void> _loginStartEvent(LoginStartEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    final message = await _loginWithUserNameUsecase(event.userDataPost);
    message.when(
        success: (data) {
          emit(LoginLoadedState(data!));
        },
        failure: (failure) => emit(LoginLoadedState(MessageEntity(message: failure.message!))));
  }
}
