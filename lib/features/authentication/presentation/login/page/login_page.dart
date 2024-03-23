import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/core/routes/app_router.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_bloc.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_event.dart';
import 'package:quizz_app/features/authentication/presentation/login/bloc/auth_state.dart';
import 'package:quizz_app/features/authentication/utils/user_data_post.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? _useNameController;
  TextEditingController? _passwordController;
  final _formKey = GlobalKey<FormState>();

  AuthBloc? _authBloc;

  @override
  void initState() {
    _useNameController = TextEditingController();
    _passwordController = TextEditingController();
    _authBloc = BlocProvider.of<AuthBloc>(context);

    super.initState();
  }

  @override
  void dispose() {
    _useNameController!.dispose();
    _passwordController!.dispose();
    super.dispose();
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
        UserDataPost(password, userName),
      ));
    }
    ;
  }

  @override
  Widget build(BuildContext logincontext) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is LoginLoadedState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // Add Your Code here.
              showDialog(
                context: logincontext,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Thoong bao'),
                    content: Text(state.messageEntity.message),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            });
          }
          return Center(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 40,
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
                            'assets/images/google_icon.svg',
                            height: 40,
                            width: 40,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/images/fb_icon.svg',
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                            ),
                            validator: validatorPass,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          state is LoginLoadingState
                              ? const CircularProgressIndicator()
                              : GestureDetector(
                                  onTap: () {
                                    login(
                                      password: _passwordController!.text,
                                      userName: _useNameController!.text,
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
                                ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have a account yet?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRouter.register);
                          },
                          child: const Text(
                            "Register!",
                            style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
