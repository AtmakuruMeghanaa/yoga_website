import 'package:flutter/material.dart';

class StressPage extends StatefulWidget {
  const StressPage({super.key});

  @override
  State<StressPage> createState() => _StressPageState();
}

class _StressPageState extends State<StressPage> {
  int score = 0;
  String result = "";

  void calculateStress() {
    if (score <= 5) {
      result = "Low Stress";
    } else if (score <= 10) {
      result = "Moderate Stress";
    } else {
      result = "High Stress";
    }

    setState(() {});
  }

  Widget question(String text) {
    return CheckboxListTile(
      title: Text(text),
      value: false,
      onChanged: (val) {
        if (val == true) {
          score += 3;
        } else {
          score -= 3;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stress Assessment"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            question("I feel anxious frequently"),
            question("I have trouble sleeping"),
            question("I feel overwhelmed"),
            question("I have difficulty concentrating"),
            question("I feel tired most of the time"),

            ElevatedButton(
              onPressed: calculateStress,
              child: const Text("Check Result"),
            ),

            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
