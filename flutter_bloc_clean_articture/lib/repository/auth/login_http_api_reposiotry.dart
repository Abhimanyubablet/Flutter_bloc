import 'package:flutter_bloc_clean_articture/Data/network/network_services_api.dart';
import 'package:flutter_bloc_clean_articture/models/user/user_model.dart';
import 'package:flutter_bloc_clean_articture/repository/auth/login_repository.dart';

import '../../config/app_url.dart';

class LoginHttpApiReposiotry implements LoginRepository{
  final _api= NetworkApiService();

  @override
  Future<UserModel> loginApi(dynamic data) async{
    final response = await _api.postApi(AppUrl.loginEndPint, data);
    return UserModel.fromJson(response);
  }
}