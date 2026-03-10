import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AsanasPage extends StatelessWidget {
  const AsanasPage({super.key});

  final List<Map<String, String>> asanas = const [
    {
      "name": "Tadasana",
      "image": "assets/images/tadasana.png",
      "description":
          "Tadasana, also known as Mountain Pose, improves posture and body alignment.",
      "benefits":
          "Enhances balance, strengthens legs, and increases concentration.",
    },
    {
      "name": "Vrikshasana",
      "image": "assets/images/vrikshasana.png",
      "description":
          "Vrikshasana, or Tree Pose, is a balancing posture that improves stability.",
      "benefits":
          "Improves focus, strengthens legs, and enhances coordination.",
    },
    {
      "name": "Bhujangasana",
      "image": "assets/images/bhujangasana.png",
      "description":
          "Bhujangasana, or Cobra Pose, strengthens the spine and opens the chest.",
      "benefits":
          "Reduces stress, improves flexibility, and strengthens back muscles.",
    },
    {
      "name": "Balasana",
      "image": "assets/images/balasana.png",
      "description":
          "Balasana, or Child’s Pose, is a calming and restorative posture.",
      "benefits":
          "Relieves anxiety, relaxes the body, and stretches the lower back.",
    },
    {
      "name": "Surya Namaskar",
      "image": "assets/images/suryanamaskar.png",
      "description":
          "Surya Namaskar is a sequence of yoga poses performed in a smooth flow.",
      "benefits":
          "Improves flexibility, boosts energy, and enhances overall fitness.",
    },
  ];

  void _showImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            /// 🔹 Heading
            Text(
              "Yoga Asanas",
              style: GoogleFonts.playfairDisplay(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            /// 🔹 Grid Layout
            Expanded(
              child: GridView.builder(
                itemCount: asanas.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 per row
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 25,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final asana = asanas[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// 🔹 Clickable Image
                      GestureDetector(
                        onTap: () => _showImage(context, asana["image"]!),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            asana["image"]!,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// 🔹 Name
                      Text(
                        asana["name"]!,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 8),

                      /// 🔹 Description (Visible by default)
                      Text(
                        asana["description"]!,
                        style: GoogleFonts.playfairDisplay(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 6),

                      /// 🔹 Benefits (Visible by default)
                      Text(
                        asana["benefits"]!,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
