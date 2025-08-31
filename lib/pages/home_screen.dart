import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(spacing: 15, children: [title(), subtitle()]),
              Column(
                spacing: 25,
                children: [classicModeButton(), reverseModeButton()],
              ),
            ],
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
    return Text(
      'Outsmart the AI… or be outguessed.',
      style: TextStyle(
        fontFamily: 'PressStart2P',
        color: Color.fromRGBO(39, 246, 163, 1.0),
        fontSize: 10,
      ),
    );
  }

  Widget classicModeButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'classic');
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
}
