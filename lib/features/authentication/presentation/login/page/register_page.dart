import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/core/routes/app_router.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_bloc.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_event.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_state.dart';
import 'package:quizz_app/features/authentication/utils/dto/register_dto/user_data_register_post.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin {
  TextEditingController? _fullNameController;
  TextEditingController? _userNameController;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  TextEditingController? _rePasswordController;
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
    _fullNameController = TextEditingController();
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _authBloc = BlocProvider.of<AuthBloc>(context);

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
    _fullNameController!.dispose();
    _userNameController!.dispose();
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  String? validatorPass(String? pass) {
    if (pass == "" || pass!.isEmpty) {
      return "khong duoc de trong pass";
    }
    if (pass.length < 6) {
      return "pass qua ngan , thu lai!";
    }
    return null;
  }

  String? validatorRePass(String? rePpass) {
    if (rePpass == "" || rePpass!.isEmpty) {
      return "khong duoc de trong pass";
    }
    if (rePpass != _passwordController!.text) {
      return "mat khau khong trung khop";
    }
    return null;
  }

  String? validatorUsername(String? userName) {
    if (userName == "" || userName!.isEmpty) {
      return "khong duoc de trong user name";
    }
    return null;
  }

  String? validatorFullname(String? fullName) {
    if (fullName == "" || fullName!.isEmpty) {
      return "khong duoc de trong full name";
    }
    return null;
  }

  String? validatorEmail(String? email) {
    if (email == "" || email!.isEmpty) {
      return "khong duoc de trong email";
    }
    if (!EmailValidator.validate(email)) {
      return "vui long nhap dung dinh dang email";
    }
    return null;
  }

  void register({required String fullName, required String userName, required String email, required String password}) {
    if (_formKey.currentState!.validate()) {
      _authBloc!.add(RegisterStartEvent(
        UserDataRegisterPost(password, userName, email, fullName),
      ));
    }
    ;
  }

  void handleRetry() {
    _authBloc!.add(AuthStartEvent());
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;

    var _registerMainWidget = switch (authState) {
      AuthCheckAlreadyLoginInitialState() => _buildRegisterInitial(),
      RegisterLoadedFailureState() => _buildRegisterLoadedFailureWidget(authState, context),
      RegisterLoadingState() => _buildRegisterLoadingWidget(),
      RegisterLoadedSuccessState() => Container(),
      _ => Container(),
    };

    _registerMainWidget = BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoadedSuccessState) {
          context.go(AppRouter.login);
          _authBloc!.add(
            LoginPrefill(password: _passwordController!.text, usename: _userNameController!.text),
          );
        }
      },
      child: _registerMainWidget,
    );
    return Scaffold(
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
                child: _registerMainWidget,
              ),
            ),
          ),
        ));
  }

  Widget _buildRegisterInitial() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Register",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: 40,
        ),
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  hintText: 'Enter your full name',
                ),
                validator: validatorFullname,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your user name',
                ),
                validator: validatorUsername,
                // obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your email',
                ),
                validator: validatorEmail,
                // obscureText: true,
              ),
              const SizedBox(
                height: 20,
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
                  ),
                ),
                validator: validatorPass,
                obscureText: isObscureText,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _rePasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Reconfirm you password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    icon: isObscureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                  ),
                ),
                validator: validatorRePass,
                obscureText: isObscureText,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  register(
                    userName: _userNameController!.text,
                    password: _passwordController!.text,
                    email: _emailController!.text,
                    fullName: _fullNameController!.text,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mainColor,
                  ),
                  child: const Text("Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            context.go(AppRouter.login);
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have a account ?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Login!",
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )
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

  Widget _buildRegisterLoadedFailureWidget(RegisterLoadedFailureState state, BuildContext context) {
    return AlertDialog(
      title: const Text('Thoong bao'),
      content: Text(state.messageEntity.message),
      actions: <Widget>[
        TextButton(
          onPressed: () => handleRetry(),
          child: const Icon(Icons.replay),
        ),
      ],
    );
  }

  Widget _buildRegisterLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
