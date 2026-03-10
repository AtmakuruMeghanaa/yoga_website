import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/gemini_service.dart';

class AIChatPanel extends StatefulWidget {
  final VoidCallback onClose;

  const AIChatPanel({super.key, required this.onClose});

  @override
  State<AIChatPanel> createState() => _AIChatPanelState();
}

class _AIChatPanelState extends State<AIChatPanel> {
  final TextEditingController controller = TextEditingController();

  List<Map<String, String>> messages = [
    {
      "sender": "ai",
      "text":
          "Namaste 🙏 I am your Yoga AI Assistant.\nAsk me anything about yoga, stress relief, breathing exercises or BMI.",
    },
  ];

  bool isLoading = false;

  // Suggested questions
  List<String> suggestions = [
    "Benefits of yoga",
    "Yoga for stress relief",
    "Beginner yoga poses",
    "Breathing exercises",
    "What is BMI?",
  ];

  Future<void> sendMessage(String text) async {
    setState(() {
      messages.add({"sender": "user", "text": text});
      isLoading = true;
    });

    controller.clear();

    try {
      String reply = await GeminiService.getResponse(
        "You are a yoga expert assistant. Answer clearly and shortly: $text",
      );

      setState(() {
        messages.add({"sender": "ai", "text": reply});
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        messages.add({
          "sender": "ai",
          "text": "Sorry, I couldn't get a response right now.",
        });
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [Color(0xFFE6F4F1), Color(0xFFD6ECE7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(-4, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Yoga AI Assistant",
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: widget.onClose,
                ),
              ],
            ),
          ),

          const Divider(),

          // Chat Messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isUser = messages[index]["sender"] == "user";

                return Align(
                  alignment: isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.green[400] : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      messages[index]["text"]!,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // AI Thinking Indicator
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text("AI is thinking..."),
            ),

          // Suggestion Chips
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ActionChip(
                    label: Text(suggestions[index]),
                    onPressed: () {
                      sendMessage(suggestions[index]);
                    },
                  ),
                );
              },
            ),
          ),

          // Input Field
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Ask something...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.green,
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      sendMessage(controller.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
