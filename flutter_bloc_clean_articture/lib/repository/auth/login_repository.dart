import 'package:flutter_bloc_clean_articture/models/user/user_model.dart';

 abstract class LoginRepository{
  Future<UserModel> loginApi(dynamic data);
}