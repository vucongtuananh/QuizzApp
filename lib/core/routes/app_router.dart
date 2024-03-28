import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_bloc.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_state.dart';
import 'package:quizz_app/features/authentication/presentation/login/page/login_page.dart';
import 'package:quizz_app/features/authentication/presentation/login/page/register_page.dart';
import 'package:quizz_app/features/home/presentation/pages/home_page.dart';

class AppRouter {
  static const String login = "/login";
  static const String register = "/register";
  static const String home = "/";
  static const publicRoutes = [
    login,
    register,
  ];
}

final goRoute = GoRouter(
    redirect: (context, state) {
      if (AppRouter.publicRoutes.contains(state.fullPath)) {
        return null;
      }
      if (context.read<AuthBloc>().state is AuthCheckAlreadyLoginSucessState) {
        return null;
      }
      return AppRouter.login;
    },
    routes: [
      // GoRoute(path: AppRouter.login,builder: (context, state) => HomePage(),),
      GoRoute(
        path: AppRouter.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRouter.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRouter.register,
        builder: (context, state) => const RegisterPage(),
      ),
    ]);
