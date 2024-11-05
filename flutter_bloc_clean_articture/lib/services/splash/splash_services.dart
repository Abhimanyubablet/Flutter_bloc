import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_clean_articture/config/routes/routes_name.dart';
import 'package:flutter_bloc_clean_articture/services/session_manager/session_controller.dart';

class SplashServices{
  void isLogin(BuildContext context){

    SessionController().getUserFromPrefrence().then((value){
      if(SessionController().isLogin ?? false){
        Timer(const Duration(seconds: 3), ()=> Navigator.pushNamedAndRemoveUntil(context,RoutesName.homeScreen,(route)=>false));
      }
      else{
        Timer(const Duration(seconds: 3), ()=> Navigator.pushNamedAndRemoveUntil(context,RoutesName.loginScreen,(route)=>false));
      }
    }).onError((error, stackTrace){
      Timer(const Duration(seconds: 3), ()=> Navigator.pushNamedAndRemoveUntil(context,RoutesName.loginScreen,(route)=>false));
    });

  }
}