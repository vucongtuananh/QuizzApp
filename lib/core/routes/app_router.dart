import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/authentication/presentation/login/page/login_page.dart';

class AppRouter {
  static const String login = "/login";
  static const String register = "/register";
  static const String home = "/home";
}

final GoRoute goRoute = GoRoute(path: AppRouter.login, routes: [
  // GoRoute(path: AppRouter.login,builder: (context, state) => HomePage(),),
  GoRoute(
    path: AppRouter.login,
    builder: (context, state) => LoginPage(),
  )
]);
