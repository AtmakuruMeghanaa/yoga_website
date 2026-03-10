import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String apiKey = "AIzaSyDhg1I6Djs77yJI03dWW3vwt5K3O9RprC8";

  static const String baseUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent";

  static Future<String> getResponse(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl?key=$apiKey"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt},
              ],
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["candidates"][0]["content"]["parts"][0]["text"];
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
