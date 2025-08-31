import 'package:flutter/material.dart';
import 'package:whodat/pages/classic_screen.dart';
import 'package:whodat/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhoDat?',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(5, 39, 51, 1.0),
        fontFamily: 'Asimovian',
      ),
      home: ClassicScreen(),

      // routes: {
      //   'homepage': (context) => HomeScreen(),
      //   'classic': (context) => Container(),
      //   'reverse': (context) => Container(),
      // },
      // initialRoute: 'homepage',
    );
  }
}
