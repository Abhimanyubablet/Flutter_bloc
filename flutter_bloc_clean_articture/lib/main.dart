import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_articture/config/routes/routes.dart';
import 'package:flutter_bloc_clean_articture/config/routes/routes_name.dart';
import 'package:flutter_bloc_clean_articture/repository/auth/login_http_api_reposiotry.dart';
import 'package:flutter_bloc_clean_articture/repository/auth/login_repository.dart';
import 'package:flutter_bloc_clean_articture/repository/movies/movies_http_api_repository.dart';
import 'package:flutter_bloc_clean_articture/repository/movies/movies_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void serviceLocator(){
  getIt.registerLazySingleton<LoginRepository>(()=> LoginHttpApiReposiotry());
  getIt.registerLazySingleton<MoviesRepository>(()=> MoviesHttpApiRepository());
}

