import 'package:flutter_bloc_clean_articture/Data/network/network_services_api.dart';
import 'package:flutter_bloc_clean_articture/models/user/user_model.dart';
import 'package:flutter_bloc_clean_articture/repository/auth/login_repository.dart';

class LoginMockApiRepository implements LoginRepository{
  final _api= NetworkApiService();

  Future<UserModel> loginApi(dynamic data) async{
    await Future.delayed(Duration(seconds: 2));
    final response = {
      "token" : "jshhj557kada"
    };
    return UserModel.fromJson(response);
  }
}