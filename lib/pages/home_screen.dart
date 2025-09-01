import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:animated_transitions/animated_transitions.dart';
import 'package:whodat/pages/classic_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SoLoud _soloud = SoLoud.instance;
  @override
  void initState() {
    super.initState();
    themeSong();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(spacing: 15, children: [title(), subtitle()]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 25,
                  children: [classicModeButton(), reverseModeButton()],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Text(
      'WhoDat?',
      style: TextStyle(
        fontFamily: 'PressStart2P',
        color: Color.fromRGBO(39, 246, 163, 1.0),
        fontSize: 30,
      ),
    );
  }

  Widget subtitle() {
    return TypeWriter.text(
      'Outsmart the AI… or be outguessed.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'PressStart2P',
        color: Color.fromRGBO(39, 246, 163, 1.0),
        fontSize: 10,
      ),
      duration: const Duration(milliseconds: 150),
    );
  }

  Widget classicModeButton() {
    return ElevatedButton(
      onPressed: () {
        // Navigator.pushNamed(context, 'classic');

        Navigator.of(context).push(
          TransitionPageRoute(
            builder: (context) => const ClassicScreen(),
            transitionAnimation: CrtShutoffTransition(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(325, 60),
        backgroundColor: Color.fromRGBO(39, 246, 163, 1.0),
        foregroundColor: Color.fromRGBO(5, 39, 51, 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      child: Text(
        'Classic Mode - Ai Guesses',
        style: TextStyle(
          fontFamily: 'PressStart2P',
          color: Color.fromRGBO(5, 39, 51, 1.0),
          fontSize: 10,
        ),
      ),
    );
  }

  Widget reverseModeButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'reverse');
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(325, 60),
        backgroundColor: Color.fromRGBO(39, 246, 163, 1.0),
        foregroundColor: Color.fromRGBO(5, 39, 51, 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      child: Text(
        'Reverse Mode - You Guess',
        style: TextStyle(
          fontFamily: 'PressStart2P',
          color: Color.fromRGBO(5, 39, 51, 1.0),
          fontSize: 10,
        ),
      ),
    );
  }

  void themeSong() async {
    await _soloud.init();
    final source = await _soloud.loadAsset('assets/sound/startup_sound.mp3');
    final handle = await _soloud.play(source);
    _soloud.setVolume(handle, 1.0);
  }
}
