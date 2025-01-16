import 'package:flutter/material.dart';

import 'api/ui/api_screen.dart';
import 'builder_listner_read/ui/counter_screen.dart';
import 'features/home/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primaryColor: Colors.teal
      ),
      // home: const Home(),
      // home: CounterScreen(),
      home: ApiScreen(),
    );
  }
}

