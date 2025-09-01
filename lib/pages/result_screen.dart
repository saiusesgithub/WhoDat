import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ResultScreen extends StatefulWidget {
  final String value;
  final String category;
  const ResultScreen({super.key, required this.value, required this.category});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 25,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Container(
                width: 500,
                height: 200,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF151820),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color.fromRGBO(39, 246, 163, 1.0),
                    width: 2,
                  ),
                  boxShadow: [BoxShadow(blurRadius: 18, spreadRadius: 2)],
                ),
                child: Center(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Text(
                            'The ${widget.category} Is : ',
                            style: const TextStyle(
                              color: Color.fromRGBO(39, 246, 163, 1.0),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.value,
                            style: const TextStyle(
                              color: Color.fromRGBO(39, 246, 163, 1.0),
                              fontSize: 30,
                              fontFamily: 'PressStart2P',
                            ),
                          ),
                          confettiWidget(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              spacing: 10,
              children: [notCorrectReportButton(), returnToHomeButton()],
            ),
          ],
        ),
      ),
    );
  }

  Widget returnToHomeButton() {
    return ElevatedButton(
      onPressed: () {
        // Navigator.pushNamed(context, 'homepage');
        Navigator.of(context).popUntil(ModalRoute.withName('homepage'));
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
        'Return to Home Screen',
        style: TextStyle(
          fontFamily: 'PressStart2P',
          color: Color.fromRGBO(5, 39, 51, 1.0),
          fontSize: 10,
        ),
      ),
    );
  }

  Widget notCorrectReportButton() {
    return Text(
      'Not Correct? Report Here',
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget confettiWidget() {
    return ConfettiWidget(
      blastDirection: pi / 2,
      confettiController: _confettiController,
      blastDirectionality: BlastDirectionality.directional,
      shouldLoop: false,
      colors: const [
        Colors.green,
        Colors.blue,
        Colors.pink,
        Colors.orange,
        Colors.purple,
      ],
    );
  }
}
