import 'package:flutter/material.dart';

class PosesPage extends StatelessWidget {
  const PosesPage({super.key});

  Widget poseCard(String name, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Image.network("https://via.placeholder.com/300x200", height: 150),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(description),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yoga Poses"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              poseCard("Tadasana", "Improves posture and balance."),
              poseCard("Vrikshasana", "Enhances concentration and stability."),
              poseCard("Bhujangasana", "Strengthens spine and reduces stress."),
              poseCard("Child's Pose", "Calms the mind and relaxes the body."),
              poseCard(
                "Surya Namaskar",
                "Full body workout and improves flexibility.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
