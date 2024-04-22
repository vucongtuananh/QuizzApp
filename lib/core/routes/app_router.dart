import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_bloc.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_state.dart';
import 'package:quizz_app/features/authentication/presentation/login/page/login_page.dart';
import 'package:quizz_app/features/authentication/presentation/login/page/register_page.dart';
import 'package:quizz_app/features/calendar/presentation/pages/calendar_page.dart';
import 'package:quizz_app/features/calendar/presentation/pages/plan_calendar.dart';
import 'package:quizz_app/features/create/presentation/pages/create_page.dart';
import 'package:quizz_app/features/home/mock/mock_data.dart';
import 'package:quizz_app/features/home/presentation/bloc/choose_answer_bloc/choose_answer_bloc.dart';
import 'package:quizz_app/features/home/presentation/bloc/progress_cubit/progress_bar_cubit.dart';
import 'package:quizz_app/features/home/presentation/bloc/write_learn/write_learn_cubit.dart';
import 'package:quizz_app/features/home/presentation/pages/card_details.dart';
import 'package:quizz_app/features/home/presentation/pages/choose_answer_learn.dart';
import 'package:quizz_app/features/home/presentation/pages/home_page.dart';
import 'package:quizz_app/features/home/presentation/pages/listen_and_type.dart';
import 'package:quizz_app/features/home/presentation/pages/write_learn.dart';
import 'package:quizz_app/features/library/presentation/pages/library_page.dart';
import 'package:quizz_app/features/profile/presentation/pages/profile_page.dart';
import 'package:quizz_app/main_screen/tab_screen.dart';

class AppRouter {
  static const String home = "/home";
  static const String library = "/library";
  static const String calendar = "/calendar";
  static const String plannerCalendar = "/planner";
  static const String create = "/create";
  static const String training = "/training";
  static const String cardDetail = "/cardDetail";
  static const String chooseAnswerLearn = "/chooseAnswerLearn";
  static const String writeLearn = "/writeLearn";
  static const String listenLearn = '/listenLearn';
  static const String login = "/login";
  static const String register = "/register";
  static const String mainScreen = "/";

  // static const String showConclusion = '/showConclusion';
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
      GoRoute(
          path: AppRouter.cardDetail,
          builder: (context, state) {
            String data = state.extra as String;
            return CardDetails(
              data: data,
            );
          }),
      GoRoute(
          path: AppRouter.chooseAnswerLearn,
          builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<ProgressBarCubit>(
                  create: (context) => ProgressBarCubit(),
                ),
                BlocProvider<ChooseAnswerBloc>(
                  create: (context) => ChooseAnswerBloc(),
                ),
              ],
              child: const ChooseAnswerLearn(),
            );
          }),
      // GoRoute(
      //     path: AppRouter.writeLearn,
      //     builder: (context, state) {
      //       return const ListenAndType();
      //     }),
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
      GoRoute(
          path: AppRouter.writeLearn,
          builder: (context, state) {
            // PageController data = state.extra as PageController;
            return MultiBlocProvider(
              providers: [
                BlocProvider<ProgressBarCubit>(
                  create: (context) => ProgressBarCubit(),
                ),
                BlocProvider<WriteLearnCubit>(
                  create: (context) => WriteLearnCubit(),
                ),
              ],
              child: WriteLearn(listWords: listWords),
            );
          }),
      GoRoute(
          path: AppRouter.listenLearn,
          builder: (context, state) {
            // PageController data = state.extra as PageController;
            return MultiBlocProvider(
              providers: [
                BlocProvider<ProgressBarCubit>(
                  create: (context) => ProgressBarCubit(),
                ),
                BlocProvider<WriteLearnCubit>(
                  create: (context) => WriteLearnCubit(),
                ),
              ],
              child: ListenLearn(listWords: listWords),
            );
          }),
    ]);
