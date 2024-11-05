import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_clean_articture/models/user/user_model.dart';
import 'package:flutter_bloc_clean_articture/services/storage/local_storage.dart';

class SessionController{
  static final SessionController _session = SessionController._internal();

  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLogin;

  SessionController._internal(){
    isLogin = false;
  }

  factory SessionController(){
    return _session;
  }

  Future<void> saveUserInPrefrence(dynamic user) async {
    localStorage.setValue("token", jsonEncode(user));
    // storing value to check login
    localStorage.setValue("isLogin", "true");
  }

  Future<void> getUserFromPrefrence() async{
    try{
      var userData = await localStorage.readValue("token");
      var isLogin = await localStorage.readValue("isLogin");

      if(userData.isNotEmpty){
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
    }catch (e){
      debugPrint(e.toString());
    }
  }

}