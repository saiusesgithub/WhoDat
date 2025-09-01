import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String value;
  const ResultScreen({super.key, required this.value});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
                child: Column(
                  children: [
                    Text(
                      'Your Character Is : ',
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
                  ],
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
}
