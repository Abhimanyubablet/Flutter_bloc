import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_articture/bloc/login/login_bloc.dart';
import 'package:flutter_bloc_clean_articture/main.dart';
import 'package:flutter_bloc_clean_articture/repository/auth/login_repository.dart';
import 'package:flutter_bloc_clean_articture/views/login/widget/login_button.dart';
import 'widget/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBlocs;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBlocs = LoginBloc(loginRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _loginBlocs,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  EmailInput(emailFocusNode: emailFocusNode),
                  const SizedBox(height: 20,),
                  PasswordInput(passwordFocusNode: passwordFocusNode,),
                  const SizedBox(height: 20,),
                  LoginButtons(formKey: formKey,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
