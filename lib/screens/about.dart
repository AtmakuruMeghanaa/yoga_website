import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background Image
          SizedBox.expand(
            child: Image.asset("assets/images/about_bg.png", fit: BoxFit.cover),
          ),

          // 🔹  overlay for readability
          Container(
            color: const Color.fromARGB(255, 206, 200, 200).withOpacity(0.6),
          ),

          // 🔹 Centered Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "WHY YOGA?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 16, 0, 0),
                      letterSpacing: 1.5,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "Yoga is a powerful practice that connects the body, mind, and soul while promoting overall well-being. "
                    "It helps students manage stress, improve focus, and maintain emotional balance in their daily lives. "
                    "For pregnant women, yoga supports gentle physical strength, relaxation, and better breathing control. "
                    "Elderly people benefit from yoga through improved flexibility, balance, and reduced joint stiffness. "
                    "Regular practice creates a healthier lifestyle and builds inner peace for people of all ages.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 18,
                      height: 1.7,
                      color: const Color.fromARGB(179, 15, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
