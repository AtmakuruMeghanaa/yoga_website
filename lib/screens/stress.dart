import 'package:flutter/material.dart';

class StressPage extends StatefulWidget {
  const StressPage({super.key});

  @override
  State<StressPage> createState() => _StressPageState();
}

class _StressPageState extends State<StressPage> {
  List<int> answers = [0, 0, 0, 0, 0, 0];

  final List<String> questions = [
    "I feel anxious frequently",
    "I have difficulty sleeping",
    "I feel overwhelmed",
    "I struggle to concentrate",
    "I feel tired easily",
    "I get irritated quickly",
  ];

  final List<String> options = [
    "Never (0)",
    "Sometimes (1)",
    "Often (2)",
    "Always (3)",
  ];

  void calculateStress() {
    int totalScore = answers.reduce((a, b) => a + b);

    String result;
    String suggestion;
    Color color;

    if (totalScore <= 5) {
      result = "Low Stress";
      suggestion = "Great! Maintain a healthy routine and regular sleep.";
      color = Colors.green;
    } else if (totalScore <= 10) {
      result = "Mild Stress";
      suggestion = "Try relaxation techniques and ensure proper sleep.";
      color = Colors.orange;
    } else {
      result = "High Stress";
      suggestion =
          "You should sleep well, practice yoga daily and reduce workload.";
      color = Colors.red;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Stress Assessment Result"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              result,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              suggestion,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget buildQuestion(int index) {
    return Container(
      width: 380, // Increased width
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            questions[index],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: DropdownButton<int>(
              value: answers[index],
              isExpanded: true,
              underline: const SizedBox(),
              items: List.generate(4, (i) {
                return DropdownMenuItem(value: i, child: Text(options[i]));
              }),
              onChanged: (value) {
                setState(() {
                  answers[index] = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          // RIGHT SIDE BLENDED IMAGE
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.15,
              child: Image.asset(
                'assets/images/stress_bg.png',
                width: MediaQuery.of(context).size.width * 0.45,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // LEFT SIDE CONTENT
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      "Stress Self Assessment",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),

                    for (int i = 0; i < questions.length; i++) buildQuestion(i),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: 220,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: calculateStress,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          "Check Stress Level",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
