import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      return "khong duoc de trong pass";
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is LoginLoadedState)
                  AlertDialog(
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
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _useNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                      hintText: 'Enter user name',
                    ),
                    validator: validatorUsername,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      labelText: 'Enter your password',
                    ),
                    validator: validatorPass,
                  ),
                ),
                state is LoginLoadingState
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          login(
                            password: _passwordController!.text,
                            userName: _useNameController!.text,
                          );
                        },
                        child: const Text("Login"),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
