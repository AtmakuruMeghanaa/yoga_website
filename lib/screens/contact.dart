import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Full Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/contact_bg.png',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
          ),

          // 🔹 Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Contact Us",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  Text(
                    "Meghana Atmakuru",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "AI - ML Department",
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "BY VVIT",
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Roll No: 22BQ1A6104",
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),

                  SizedBox(height: 25),

                  Text(
                    "yogaawareness@gmail.com",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "For yoga guidance, stress management tips\n"
                    "and health related queries,\n"
                    "feel free to reach out via email.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white70),
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
