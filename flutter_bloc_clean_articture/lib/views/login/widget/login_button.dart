import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_articture/Utils/enums.dart';
import 'package:flutter_bloc_clean_articture/Utils/flush_bar_helper.dart';
import 'package:flutter_bloc_clean_articture/config/routes/routes_name.dart';

import '../../../bloc/login/login_bloc.dart';

class LoginButtons extends StatelessWidget {
  final formKey;

  const LoginButtons({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (current, previous) => current.postApiStatus !=previous.postApiStatus,
      listener: (context, state) {

        if(state.postApiStatus == PostApiStatus.error){
          FlushBarHelper.flushBarErrorMessage(state.message.toString(),context);
        }

        if(state.postApiStatus == PostApiStatus.success){
          Navigator.pushNamed(context, RoutesName.homeScreen);
          FlushBarHelper.flushBarSuccessMessage("Login Successful",context);
        }

      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (current, previous) => current.postApiStatus !=previous.postApiStatus,
        builder: (context, state) {
          return Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                 context.read<LoginBloc>().add(LoginApi());
                }
              },
              child:state.postApiStatus ==PostApiStatus.loading ? CircularProgressIndicator() : const Text("Login"),

            ),
          );
        },
      ),
    );
  }
}
