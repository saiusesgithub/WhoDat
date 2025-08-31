import 'dart:convert';
import 'package:dio/dio.dart';

class GeminiApi {
  final String model = 'gemini-1.5-flash';
  final String apiKey = 'AIzaSyCfx_meeilsG8h5onMqNaR7uxa2Zaramo4';
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://generativelanguage.googleapis.com/v1beta',
      connectTimeout: const Duration(seconds: 7),
      receiveTimeout: const Duration(seconds: 12),
    ),
  );

  Future<Map<String, dynamic>> nextTurn({
    required String category,
    required List<Map<String, String>> history, // [{q:'...', a:'Yes'}, ...]
  }) async {
    // System instruction to force JSON
    final systemText =
        '''
You are a guessing game AI for the app "WhoDat".
Goal: Ask one discriminative yes/no question at a time to guess the user's character from category: $category.
Rules:
- Always return strict JSON with keys: question (string or null), guess (string or null), status ("ongoing" or "final").
- If confident, set status="final" and provide a single best guess.
- Keep questions short and unambiguous. Avoid open-ended questions.
- Respect the answer set: Yes / No / Maybe / Don't know.
''';

    // Compact history string
    final historyLines = history
        .map((e) => "- Q: ${e['q']} | A: ${e['a']}")
        .join("\n");
    final userText =
        '''
Game state:
Category: $category
History so far:
$historyLines

Return JSON only. Example:
{"question":"Is your character alive?","guess":null,"status":"ongoing"}
or
{"question":null,"guess":"Robert Downey Jr.","status":"final"}
''';

    final body = {
      "systemInstruction": {
        "role": "system",
        "parts": [
          {"text": systemText},
        ],
      },
      "contents": [
        {
          "role": "user",
          "parts": [
            {"text": userText},
          ],
        },
      ],
      "generationConfig": {"response_mime_type": "application/json"},
    };

    final response = await _dio.post(
      '/models/$model:generateContent',
      queryParameters: {"key": apiKey},
      data: jsonEncode(body),
      options: Options(headers: {"Content-Type": "application/json"}),
    );

    // Gemini returns candidates[0].content.parts[0].text
    final text =
        response.data?['candidates']?[0]?['content']?['parts']?[0]?['text'];
    if (text is! String || text.isEmpty) {
      throw Exception('Empty response from Gemini');
    }
    return jsonDecode(text) as Map<String, dynamic>;
  }
}
