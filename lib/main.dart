import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:whodat/pages/classic_screen.dart';
import 'package:whodat/pages/home_screen.dart';
import 'package:whodat/pages/result_screen.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(39, 246, 163, 1.0),
        ),
        scaffoldBackgroundColor: Color.fromRGBO(5, 39, 51, 1.0),
        fontFamily: 'Asimovian',
      ),

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'homepage':
            return PageAnimationTransition(
              pageAnimationType: FadeAnimationTransition(),
              page: HomeScreen(),
            );
          case 'classic':
            return PageAnimationTransition(
              pageAnimationType: FadeAnimationTransition(),
              page: ClassicScreen(),
            );
          case 'reverse':
            return PageAnimationTransition(
              pageAnimationType: FadeAnimationTransition(),
              page: Container(),
            );
          case 'result':
            return PageAnimationTransition(
              pageAnimationType: FadeAnimationTransition(),
              page: ResultScreen(value: 'value'),
            );
          default:
            return null;
        }
      },
      initialRoute: 'homepage',

      // routes: {
      //   'homepage': (context) => HomeScreen(),
      //   'classic': (context) => ClassicScreen(),
      //   'reverse': (context) => Container(),
      //   'result': (context) => ResultScreen(value: 'value'),
      // },
      // initialRoute: 'homepage',
    );
  }
}
