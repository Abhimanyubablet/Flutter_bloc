import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_articture/Utils/enums.dart';
import 'package:flutter_bloc_clean_articture/repository/auth/login_repository.dart';
import 'package:flutter_bloc_clean_articture/views/login/widget/login_button.dart';

import '../../services/session_manager/session_controller.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents,LoginState>{

  LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}): super(const LoginState()){
   on<EmailChanged>(_onEmailChanged);
   on<PasswordChanged>(_onPasswordChanged);
   on<LoginApi>(_loginApi);

  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit){
    print(event.email);
    emit(state.copyWith( email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit){
    emit(state.copyWith( password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async{

    Map data = {"email": state.email, "password" : state.password};

    emit(state.copyWith( postApiStatus: PostApiStatus.loading));

    await loginRepository.loginApi(data).then((value) async {
       if(value.error.isNotEmpty){
         emit(state.copyWith( message: value.error.toString(),postApiStatus: PostApiStatus.error));
       }else{
         await SessionController().saveUserInPrefrence(value);
         await SessionController().getUserFromPrefrence();

         emit(state.copyWith( message: "Login Successful",postApiStatus: PostApiStatus.success));
       }
    }).onError((error,stackTrace){
      emit(state.copyWith( message: error.toString(),postApiStatus: PostApiStatus.error));
    });

  }

}