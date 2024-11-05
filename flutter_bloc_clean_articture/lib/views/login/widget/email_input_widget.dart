import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_articture/Utils/validations.dart';
import 'package:flutter_bloc_clean_articture/bloc/login/login_bloc.dart';

class EmailInput extends StatelessWidget {
  final FocusNode emailFocusNode;
  const EmailInput({super.key, required this.emailFocusNode});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (current,previous) => current.email != previous.email,
        builder:(context, state) {
          return TextFormField(
            focusNode: emailFocusNode, // Setting focus node
            decoration: InputDecoration(
              hintText: "Email",
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              context.read<LoginBloc>().add(EmailChanged(email: value));
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter email';
              }

              if (!Validations.emailValidator(value)) {
                return 'Please enter a valid email';
              }


              return null;
            },
            onFieldSubmitted: (value){},
            textInputAction: TextInputAction.next,
          );
        },
    );
  }
}