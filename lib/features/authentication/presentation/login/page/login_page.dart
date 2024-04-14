import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/core/routes/app_router.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_bloc.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_event.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_state.dart';
import 'package:quizz_app/features/authentication/utils/dto/login_dto/user_data_post.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late final authState = context.watch<AuthBloc>().state;
  late final _useNameController = TextEditingController(text: (switch (authState) { LoginInitialState(username: final username) => username, _ => '' }));
  late final _passwordController = TextEditingController(text: (switch (authState) { LoginInitialState(password: final password) => password, _ => '' }));

  final _formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  AuthBloc? _authBloc;

  // final Duration _duration = const Duration(milliseconds: 400);
  // late AnimationController _animationController;
  // late Animation<Offset> _animation;
  // late Animation<Offset> _animationAlign;
  // late Animation<double> _curvedAnimation;
  // late Animation<double> _animationOpacity;

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context, listen: false);
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: _duration,
    // );

    // _curvedAnimation = CurvedAnimation(
    //   parent: _animationController,
    //   curve: Curves.easeInOutCubic,
    // );

    // _animation = Tween<Offset>(
    //   begin: const Offset(-0.1, 0),
    //   end: const Offset(0, 0),
    // ).animate(_curvedAnimation);

    // _animationOpacity = Tween<double>(begin: 0, end: 1).animate(_curvedAnimation);

    // _animationController.forward();
    // _animationController.addListener(() {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  void dispose() {
    _useNameController.dispose();
    _passwordController.dispose();
    _authBloc!.close();
    // _animationController.dispose();
    super.dispose();
  }

  void handleRetry() {
    _authBloc!.add(AuthStartEvent());
  }

  String? validatorPass(String? pass) {
    if (pass == "" || pass!.isEmpty) {
      return "khong duoc de trong pass";
    }
    return null;
  }

  String? validatorUsername(String? userName) {
    if (userName == "" || userName!.isEmpty) {
      return "khong duoc de trong name";
    }
    return null;
  }

  void login({required String userName, required String password}) {
    if (_formKey.currentState!.validate()) {
      _authBloc!.add(LoginStartEvent(
        UserDataLoginPost(password, userName),
      ));
    }
    ;
  }

  @override
  Widget build(BuildContext logincontext) {
    final authState = context.watch<AuthBloc>().state;

    var loginMainWidget = (switch (authState) {
      AuthCheckAlreadyLoginInitialState() => _buildLoginInitialWidget(),
      LoginInitialState() => _buildLoginInitialWidget(),
      LoginLoadedFailureState() => _buildLoginLoadedFailureWidget(authState, context),
      LoginLoadingState() => _buildLoginLoadingWidget(),
      LoginLoadedSuccessState() => const SizedBox(),
      _ => const SizedBox(),
    });
    loginMainWidget = BlocListener<AuthBloc, AuthState>(
        // listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          switch (state) {
            case LoginLoadedSuccessState():
              context.read<AuthBloc>().add(AuthCheckAlreadyLoginEvent());
              break;
            case AuthCheckAlreadyLoginSucessState():
              context.go(AppRouter.mainScreen);
              break;
          }
        },
        child: loginMainWidget);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 158, 190, 248),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: Center(
              child: Container(
                // height: _size.height * 0.55,
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  // top: 200,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: loginMainWidget,
              ),
            ),
          ),
        ));
  }

  Widget _buildLoginInitialWidget() {
    return Column(
      children: [
        const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: mainColor,
                    width: 1.5,
                  )),
              child: SvgPicture.asset(
                'assets/images/icon/google_icon.svg',
                height: 40,
                width: 40,
              ),
            ),
            SvgPicture.asset(
              'assets/images/icon/fb_icon.svg',
              height: 50,
              width: 50,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFormField(
              controller: _useNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Enter user name',
              ),
              validator: validatorUsername,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    icon: isObscureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                  )),
              validator: validatorPass,
              obscureText: isObscureText,
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                login(
                  password: _passwordController.text,
                  userName: _useNameController.text,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: mainColor,
                ),
                child: const Text("Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            context.go(AppRouter.register);
          },
          child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Don't have a account yet?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Register!",
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.bold,
              ),
            )
          ]),
        ),
      ]
          .animate(
            interval: 50.ms,
          )
          .slideX(
            begin: -0.1,
            end: 0,
            curve: Curves.easeInOutCubic,
            duration: 400.ms,
          )
          .fadeIn(
            curve: Curves.easeInOutCubic,
            duration: 400.ms,
          ),
    );
  }

  Widget _buildLoginLoadedFailureWidget(LoginLoadedFailureState state, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // const Text(
        //   'Thông báo',
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        // ),
        const SizedBox(
          height: 20,
        ),
        Text(
          state.messageEntity.message,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () => handleRetry(),
          child: const Icon(
            Icons.replay,
            size: 50,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginLoadingWidget() {
    return const CircularProgressIndicator();
  }
}
