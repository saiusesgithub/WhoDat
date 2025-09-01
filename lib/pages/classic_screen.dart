import 'package:flutter/material.dart';
import 'package:pixelarticons/pixel.dart';
import 'package:pixelarticons/pixelarticons.dart';
import 'package:whodat/pages/result_screen.dart';
import 'package:whodat/services/gemini_api_service.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

class ClassicScreen extends StatefulWidget {
  const ClassicScreen({super.key});

  @override
  State<ClassicScreen> createState() => _ClassicScreenState();
}

class _ClassicScreenState extends State<ClassicScreen> {
  final SoLoud _soloud = SoLoud.instance;
  bool? loading = false;
  bool _navigated = false;
  GeminiApi? api;
  String? question;
  String? finalGuess;
  String status = 'ongoing';
  final String category = 'Movie Actors';
  final List<Map<String, String>> history = [];
  @override
  void initState() {
    super.initState();
    api = GeminiApi();
    getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
      body: (loading == true && question == null)
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
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
                          // Row(
                          //   spacing: 10,
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [maybeButton(), idkButton()],
                          // ),
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
    return SizedBox(
      height: 200,

      child: Card(
        color: Color.fromRGBO(39, 246, 163, 1.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          // child: Text(
          //   '$question',
          //   style: TextStyle(color: Color.fromRGBO(5, 39, 51, 1.0), fontSize: 30),
          // ),
          child: TypeWriter.text(
            '$question',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(5, 39, 51, 1.0),
              fontSize: 30,
            ),
            duration: const Duration(milliseconds: 50),
          ),
        ),
      ),
    );
  }

  Widget yesButton() {
    return ElevatedButton(
      onPressed: () {
        buttonSound();
        _answer('Yes');
      },
      style: ElevatedButton.styleFrom(
        // minimumSize: Size(200, 40),
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
      onPressed: () {
        buttonSound();
        _answer('No');
      },
      style: ElevatedButton.styleFrom(
        // minimumSize: Size(200, 40),
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

  Future<void> getQuestion() async {
    setState(() {
      loading = true;
    });
    try {
      final json = await api!.nextTurn(category: category, history: history);
      setState(() {
        question = json['question'];
        finalGuess = json['guess'];
        status = json['status'] ?? 'ongoing';
      });
      if (status == 'final' &&
          finalGuess!.isNotEmpty &&
          !_navigated &&
          mounted) {
        _navigated = true;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(value: finalGuess!),
          ),
        );
      }
    } catch (e) {
      print(e);
      // fallback
      setState(() {
        question = 'Is your character alive?';
        status = 'ongoing';
      });
    } finally {
      setState(() => loading = false);
    }
  }

  Future<void> _answer(String a) async {
    if (status == 'final') return;
    // record the last question + answer
    history.add({'q': question ?? 'Unknown', 'a': a});
    await getQuestion();
  }

  void buttonSound() async {
    await _soloud.init();
    final source = await _soloud.loadAsset('assets/sound/button_sound.mp3');
    final handle = await _soloud.play(source);
    _soloud.setVolume(handle, 1.0);
  }
}
