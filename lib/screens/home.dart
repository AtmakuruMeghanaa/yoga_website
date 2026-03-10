import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/ai_chat_panel.dart';
import '../language_provider.dart';
import '../translations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChatOpen = false;

  void toggleChat() {
    setState(() {
      isChatOpen = !isChatOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// 🌍 CURRENT LANGUAGE
    final language = context.watch<LanguageProvider>().currentLanguage;
    final text = translations[language]!;

    return Scaffold(
      body: Stack(
        children: [
          /// 🔹 BACKGROUND IMAGE
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/yoga_pose.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 🔹 DARK OVERLAY
          Container(color: const Color(0xFF4B7783).withOpacity(0.7)),

          /// 🔹 MAIN CONTENT
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
              child: Column(
                children: [
                  /// 🔹 NAVBAR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// LOGO TITLE
                      Text(
                        text["title"]!,
                        style: GoogleFonts.lato(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      /// NAVIGATION
                      Row(
                        children: [
                          navButton(context, text["about"]!, '/about'),
                          navButton(context, text["bmi"]!, '/bmi'),
                          navButton(context, text["stress"]!, '/stress'),

                          languageButton(context),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 120),

                  /// 🔹 HERO SECTION
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 550,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// TAGLINE
                            Text(
                              text["tagline"]!,
                              style: GoogleFonts.dancingScript(
                                fontSize: 26,
                                color: const Color.fromARGB(255, 3, 0, 10),
                              ),
                            ),

                            const SizedBox(height: 20),

                            /// HERO TITLE
                            Text(
                              text["heroTitle"]!,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.3,
                              ),
                            ),

                            const SizedBox(height: 20),

                            /// DESCRIPTION
                            Text(
                              text["description"]!,
                              style: GoogleFonts.lato(
                                fontSize: 17,
                                color: Colors.white70,
                                height: 1.6,
                              ),
                            ),

                            const SizedBox(height: 40),

                            /// BUTTONS
                            Row(
                              children: [
                                /// EXPLORE ASANAS BUTTON
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/asanas');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 35,
                                      vertical: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF1EBE3C),
                                          Color(0xFF0A8F2F),
                                        ],
                                      ),
                                    ),
                                    child: Text(
                                      text["exploreAsanas"]!,
                                      style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 25),

                                /// CONTACT BUTTON
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/contact');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 35,
                                      vertical: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: Colors.white.withOpacity(0.15),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Text(
                                      text["contact"]!,
                                      style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// 🤖 AI CHAT PANEL
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            right: isChatOpen ? 0 : -420,
            top: 60,
            bottom: 60,
            child: SizedBox(
              width: 400,
              child: AIChatPanel(
                onClose: () {
                  setState(() {
                    isChatOpen = false;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 NAV BUTTON
  Widget navButton(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(
          title,
          style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  /// 🌍 LANGUAGE SELECTOR
  Widget languageButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: const Icon(Icons.language, color: Colors.white),
          iconEnabledColor: Colors.white,
          dropdownColor: Colors.white,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          value: context.watch<LanguageProvider>().currentLanguage,

          items: const [
            DropdownMenuItem(value: "en", child: Text("English")),
            DropdownMenuItem(value: "hi", child: Text("हिंदी")),
            DropdownMenuItem(value: "te", child: Text("తెలుగు")),
          ],

          onChanged: (value) {
            context.read<LanguageProvider>().changeLanguage(value!);
          },
        ),
      ),
    );
  }
}
