import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_bloc.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_state.dart';
import 'package:quizz_app/features/authentication/presentation/login/page/login_page.dart';
import 'package:quizz_app/features/authentication/presentation/login/page/register_page.dart';
import 'package:quizz_app/features/calendar/presentation/pages/calendar_page.dart';
import 'package:quizz_app/features/calendar/presentation/pages/plan_calendar.dart';
import 'package:quizz_app/features/create/presentation/pages/create_page.dart';
import 'package:quizz_app/features/home/presentation/pages/home_page.dart';
import 'package:quizz_app/features/library/presentation/pages/library_page.dart';
import 'package:quizz_app/features/profile/presentation/pages/training_page.dart';
import 'package:quizz_app/main_screen/tab_screen.dart';

class AppRouter {
  static const String home = "/home";
  static const String library = "/library";
  static const String calendar = "/calendar";
  static const String plannerCalendar = "/planner";
  static const String create = "/create";
  static const String training = "/training";
  static const String cardDetail = "/cardDetail";
  static const String login = "/login";
  static const String register = "/register";
  static const String mainScreen = "/";
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
        path: AppRouter.mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: AppRouter.home,
        builder: (context, state) => const HomePage(),
      ),
      // GoRoute(
      //   path: AppRouter.cardDetail,
      //   builder: (context, state) => const CardDetails(),
      // ),
      GoRoute(
        path: AppRouter.library,
        builder: (context, state) => const LibraryPage(),
      ),
      GoRoute(
        path: AppRouter.calendar,
        builder: (context, state) => const CalendarPage(),
      ),
      GoRoute(
        path: AppRouter.plannerCalendar,
        builder: (context, state) => const PlannerCalendar(),
      ),
      GoRoute(
        path: AppRouter.create,
        builder: (context, state) => const CreatePage(),
      ),
      GoRoute(
        path: AppRouter.training,
        builder: (context, state) => const PersonalPage(),
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
