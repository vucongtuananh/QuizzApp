import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/core/routes/app_router.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_bloc.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_event.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget homeWidget = Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Home"),
            TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthLogoutStartEvent());
                },
                child: Text("Logout")),
          ],
        ),
      ),
    );
    homeWidget = BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLogoutSuccessState) {
          context.read<AuthBloc>().add(AuthStartEvent());
          context.pushReplacement(AppRouter.login);
        }
      },
      child: homeWidget,
    );
    return homeWidget;
  }
}
