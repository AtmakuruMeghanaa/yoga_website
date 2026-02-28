import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AsanasPage extends StatelessWidget {
  const AsanasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            /// 🔹 Main Heading
            Text(
              "Yoga Asanas",
              style: GoogleFonts.playfairDisplay(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            /// 🔹 Asanas List
            Expanded(
              child: ListView(
                children: const [
                  AsanaTile(
                    imagePath: "assets/images/tadasana.png",
                    name: "Tadasana",
                    description:
                        "Tadasana, also known as Mountain Pose, is a foundational standing posture that improves posture and balance.",
                    benefits:
                        "Benefits: Enhances body alignment, strengthens legs, and improves concentration.",
                  ),

                  AsanaTile(
                    imagePath: "assets/images/vrikshasana.png",
                    name: "Vrikshasana",
                    description:
                        "Vrikshasana, or Tree Pose, is a balancing pose that requires focus and stability.",
                    benefits:
                        "Benefits: Improves balance, strengthens legs, and increases mental focus.",
                  ),

                  AsanaTile(
                    imagePath: "assets/images/bhujangasana.png",
                    name: "Bhujangasana",
                    description:
                        "Bhujangasana, or Cobra Pose, is a gentle backbend that opens the chest and strengthens the spine.",
                    benefits:
                        "Benefits: Reduces stress, improves spinal flexibility, and strengthens back muscles.",
                  ),

                  AsanaTile(
                    imagePath: "assets/images/balasana.png",
                    name: "Balasana",
                    description:
                        "Balasana, also called Child’s Pose, is a resting posture that promotes relaxation.",
                    benefits:
                        "Benefits: Calms the mind, relieves back pain, and reduces anxiety.",
                  ),

                  AsanaTile(
                    imagePath: "assets/images/suryanamaskar.png",
                    name: "Surya Namaskar",
                    description:
                        "Surya Namaskar is a sequence of yoga poses performed in a flow to energize the body.",
                    benefits:
                        "Benefits: Improves flexibility, boosts circulation, and enhances overall fitness.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Custom Widget for Each Asana
class AsanaTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;
  final String benefits;

  const AsanaTile({
    super.key,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.benefits,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(15),
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),

        /// 🔹 Image + Name (Always Visible)
        title: Column(
          children: [
            Image.asset(imagePath, height: 180, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              name,
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),

        /// 🔹 Description & Benefits (On Click)
        children: [
          Text(
            description,
            style: GoogleFonts.playfairDisplay(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            benefits,
            style: GoogleFonts.playfairDisplay(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
