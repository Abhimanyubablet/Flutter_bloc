import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_bloc.dart';

class PasswordInput extends StatelessWidget {
  final FocusNode passwordFocusNode;

  const PasswordInput({super.key, required this.passwordFocusNode});

  @override

  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current,previous) => current.password != previous.password,
      builder:(context, state) {
        return TextFormField(
          focusNode: passwordFocusNode,
          decoration: InputDecoration(
              hintText: "Password"
          ),
          obscureText: true,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter password';
            }
            if (value.length < 6) {
              return 'please enter password greater than 6 char';
            }
            return null;
          },
          onChanged: (value) {
              context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }

}