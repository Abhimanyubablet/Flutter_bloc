import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/posts/posts_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/switch_example/switch_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/todo/to_do_bloc.dart';
import 'package:flutter_bloc_tutorial/repository/favourite_repository.dart';
import 'package:flutter_bloc_tutorial/ui/counter/counter_screen.dart';
import 'package:flutter_bloc_tutorial/ui/favourite_app/favourite_app_screen.dart';
import 'package:flutter_bloc_tutorial/ui/image_picker/image_picker_screen.dart';
import 'package:flutter_bloc_tutorial/ui/login/login_screen.dart';
import 'package:flutter_bloc_tutorial/ui/posts/posts_screen.dart';
import 'package:flutter_bloc_tutorial/ui/switch_example/switch_example_screen.dart';
import 'package:flutter_bloc_tutorial/ui/todo/to_do_screen/to_do_screen.dart';

import 'Utils/image_picker_utils.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // We Use CounterBloc() Locally so comment this

        // BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteReprository())),
        BlocProvider(create: (_) => PostsBloc()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const CounterScreen(),
        // home: SwitchExampleScreen(),
        // home: ImagePickerScreen(),
        // home: ToDoScreen(),
        // home: FavouriteAppScreen(),
        // home: PostsScreen(),
        home: LoginScreen(),
      ),
    );
  }
}

