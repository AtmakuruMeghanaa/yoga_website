import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Yoga"),
        backgroundColor: Colors.green,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "History of Yoga",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Yoga originated in ancient India over 5,000 years ago. "
                "It is a practice that connects body, mind, and breath.",
              ),

              SizedBox(height: 20),

              Text(
                "Benefits of Yoga",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "• Improves flexibility\n"
                "• Reduces stress\n"
                "• Improves concentration\n"
                "• Enhances mental health",
              ),

              SizedBox(height: 20),

              Text(
                "Why Yoga is Important for Students",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Yoga helps students manage stress, improve focus, "
                "and maintain physical health.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
