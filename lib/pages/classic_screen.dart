import 'package:flutter/material.dart';
import 'package:pixelarticons/pixel.dart';
import 'package:pixelarticons/pixelarticons.dart';

class ClassicScreen extends StatefulWidget {
  const ClassicScreen({super.key});

  @override
  State<ClassicScreen> createState() => _ClassicScreenState();
}

class _ClassicScreenState extends State<ClassicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton.outlined(
          onPressed: () {},
          icon: Icon(Pixel.arrowleft),
        ),
        backgroundColor: Color.fromRGBO(39, 246, 163, 1.0),
        title: Text(
          'Classic Mode',
          style: TextStyle(
            fontFamily: 'PressStart2P',
            color: Color.fromRGBO(5, 39, 51, 1.0),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
