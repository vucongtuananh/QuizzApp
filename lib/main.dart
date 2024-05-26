import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/core/di/app_di.dart';
import 'package:quizz_app/core/routes/app_router.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_bloc.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_event.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_state.dart';
import 'package:quizz_app/features/calendar/presentation/pages/calendar_page.dart';
import 'package:quizz_app/local_notification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await LocalNotifications.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // locator<ResponsiveUIConfig>().initialize(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<AuthBloc>(),
        )
      ],
      child: AppContent(),
    );
  }
}

class AppContent extends StatefulWidget {
  const AppContent({
    super.key,
  });

  @override
  State<AppContent> createState() => _AppContentState();
}

class _AppContentState extends State<AppContent> {
  @override
  void initState() {
    super.initState();
    // listenToNotifications();
    context.read<AuthBloc>().add(AuthCheckAlreadyLoginEvent());
  }

 

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    if (authState is AuthInitialState) {
      return Container();
    }
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        useMaterial3: true,
      ),
    );
  }
}
