import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/yoga_pose.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔹 Soft Overlay
          Container(color: const Color(0xFF4B7783).withOpacity(0.7)),

          // 🔹 Main Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
              child: Column(
                children: [
                  // 🔹 Top Navigation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Yoga Awareness Portal",
                        style: GoogleFonts.lato(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      Row(
                        children: [
                          navButton(context, "About", '/about'),
                          navButton(context, "BMI", '/bmi'),
                          navButton(context, "Stress", '/stress'),

                          // 🔥 NEW CHAT BUTTON
                          chatButton(context),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 120),

                  // 🔹 HERO SECTION (Text on RIGHT)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 550,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Breathe • Flow • Grow",
                              style: GoogleFonts.dancingScript(
                                fontSize: 26,
                                color: const Color.fromARGB(255, 3, 0, 10),
                              ),
                            ),

                            const SizedBox(height: 20),

                            Text(
                              "DISCOVER YOUR POTENTIAL\nUNLOCK THE BENEFITS\nOF YOGA PRACTICE",
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.3,
                              ),
                            ),

                            const SizedBox(height: 20),

                            Text(
                              "Improve mental health, reduce stress, and stay physically fit through guided yoga practices and smart self-assessment tools.",
                              style: GoogleFonts.lato(
                                fontSize: 17,
                                color: Colors.white70,
                                height: 1.6,
                              ),
                            ),

                            const SizedBox(height: 40),

                            // 🔥 Modern Buttons
                            Row(
                              children: [
                                // 🔥 Gradient Explore Button
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
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
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.green.withOpacity(
                                              0.4,
                                            ),
                                            blurRadius: 15,
                                            offset: const Offset(0, 6),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        "Explore Asanas",
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 25),

                                // 🌿 Glass Contact Button
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
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
                                        "Contact Us",
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
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
        ],
      ),
    );
  }

  // 🔹 Navigation Button
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

  // 🔥 NEW Chat Button with Icon
  Widget chatButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton.icon(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/chat',
          ); // Make sure you create chat route
        },
        icon: const Icon(Icons.message, color: Colors.white),
        label: Text(
          "Chat With Us",
          style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
