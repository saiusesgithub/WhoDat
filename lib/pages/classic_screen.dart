import 'package:flutter/material.dart';
import 'package:pixelarticons/pixel.dart';
import 'package:pixelarticons/pixelarticons.dart';
import 'package:whodat/services/gemini_api_service.dart';

class ClassicScreen extends StatefulWidget {
  const ClassicScreen({super.key});

  @override
  State<ClassicScreen> createState() => _ClassicScreenState();
}

class _ClassicScreenState extends State<ClassicScreen> {
  bool? loading;
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
      body: (loading == true && question == null)
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
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
          '$question',
          style: TextStyle(color: Color.fromRGBO(5, 39, 51, 1.0), fontSize: 30),
        ),
      ),
    );
  }

  Widget yesButton() {
    return ElevatedButton(
      onPressed: () {
        _answer('yes');
      },
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
      onPressed: () {
        _answer('no');
      },
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
    } catch (e) {
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
}



/// 
/// 
/// 
/// 
/// 
/// 
/// 




// import 'package:shared_preferences/shared_preferences.dart';


// class _ClassicScreenState extends State<ClassicScreen> {

 

//   void _confirmFinal(bool correct) async {
//     // simple local streak
//     final prefs = await SharedPreferences.getInstance();
//     final current = prefs.getInt('streak') ?? 0;
//     final next = correct ? (current + 1) : 0;
//     await prefs.setInt('streak', next);
//     if (!mounted) return;
//     Navigator.pushNamed(context, '/result', arguments: {
//       'won': correct,
//       'questions': _history.length,
//       'guess': _f inalGuess,
//       'streak': next,
//     });
//   }

     
//       Column(
     
//                 children: [
                  
//                     Row(
//                       children: [
//                         Expanded(child: _GlowButton(label: '✅ Correct', color: accent, onTap: () => _confirmFinal(true))),
//                         const SizedBox(width: 12),
//                         Expanded(child: _GlowButton(label: '❌ Wrong', color: Colors.redAccent, onTap: () => _confirmFinal(false))),
//                       ],
//                     )
//                   ] else ...[

//                     _QuestionCard(text: _question ?? '…', accent: accent),
//                     const SizedBox(height: 16),
//                     Wrap(
//                       spacing: 12,
//                       runSpacing: 12,
//                       children: [
//                         _GlowButton(label: 'Yes', color: accent, onTap: () => _answer('Yes')),
//                         _GlowButton(label: 'No', color: accent, onTap: () => _answer('No')),
//                         _GlowButton(label: 'Maybe', color: accent, onTap: () => _answer('Maybe')),
//                         _GlowButton(label: "Don't know", color: accent, onTap: () => _answer("Don't know")),
//                       ],
//                     ),
//                   ],
//                 ],
//               ),
//       ),
//     );
//   }
// }



// class _ResultCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final Color accent;
//   const _ResultCard({required this.title, required this.value, required this.accent});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: const Color(0xFF151820),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: accent, width: 1.5),
//         boxShadow: [BoxShadow(color: accent.withOpacity(0.6), blurRadius: 18, spreadRadius: 2)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: const TextStyle(color: Colors.white70)),
//           const SizedBox(height: 6),
//           Text(value, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600)),
//         ],
//       ),
//     );
//   }
// }

// class _GlowButton extends StatelessWidget {
//   final String label;
//   final VoidCallback onTap;
//   final Color color;
//   const _GlowButton({required this.label, required this.onTap, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         decoration: BoxDecoration(
//           color: color.withOpacity(0.12),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: color, width: 1.5),
//           boxShadow: [BoxShadow(color: color.withOpacity(0.7), blurRadius: 12, spreadRadius: 1)],
//         ),
//         child: Center(
//           child: Text(
//             label,
//             style: const TextStyle(
//               // swap to your arcade font if added: fontFamily: 'PressStart2P',
//               letterSpacing: 1.1,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

