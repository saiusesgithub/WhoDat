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
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Pixel.arrowleft, color: Color.fromRGBO(5, 39, 51, 1.0)),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                questionCard(),
                Column(
                  spacing: 10,
                  children: [
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [yesButton(), noButton()],
                    ),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [maybeButton(), idkButton()],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget questionCard() {
    return Card(
      color: Color.fromRGBO(39, 246, 163, 1.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'Sample Question which is supposed to be really long?',
          style: TextStyle(color: Color.fromRGBO(5, 39, 51, 1.0), fontSize: 30),
        ),
      ),
    );
  }

  Widget yesButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 40),
        backgroundColor: Color.fromRGBO(39, 246, 163, 1.0),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        'Yes',
        style: TextStyle(
          fontFamily: 'PressStart2P',
          color: Color.fromRGBO(5, 39, 51, 1.0),
          fontSize: 14,
        ),
      ),
    );
  }

  Widget noButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 40),
        backgroundColor: Color.fromRGBO(39, 246, 163, 1.0),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        'No',
        style: TextStyle(
          fontFamily: 'PressStart2P',
          color: Color.fromRGBO(5, 39, 51, 1.0),
          fontSize: 14,
        ),
      ),
    );
  }

  Widget maybeButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 40),
        backgroundColor: Color.fromRGBO(39, 246, 163, 1.0),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        'Maybe',
        style: TextStyle(
          fontFamily: 'PressStart2P',
          color: Color.fromRGBO(5, 39, 51, 1.0),
          fontSize: 14,
        ),
      ),
    );
  }

  Widget idkButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 40),
        backgroundColor: Color.fromRGBO(39, 246, 163, 1.0),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        'i don\'t know',
        style: TextStyle(
          fontFamily: 'PressStart2P',
          color: Color.fromRGBO(5, 39, 51, 1.0),
          fontSize: 14,
        ),
      ),
    );
  }
}
