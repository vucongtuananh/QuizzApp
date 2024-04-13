import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/core/routes/app_router.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_bloc.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_event.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_state.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    Widget personalWidget = Center(
      child: ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(AuthLogoutStartEvent());
          },
          child: Text("Log out")),
    );

    personalWidget = BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLogoutSuccessState) {
          context.read<AuthBloc>().add(AuthStartEvent());
          context.pushReplacement(AppRouter.login);
        }
      },
      child: personalWidget,
    );

    return Scaffold(body: personalWidget);
  }
}
