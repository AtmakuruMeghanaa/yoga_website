import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  void calculateBMI() {
    if (ageController.text.isEmpty ||
        heightController.text.isEmpty ||
        weightController.text.isEmpty) {
      showResultDialog("Error", "Please fill all fields", Colors.red);
      return;
    }

    double height = double.tryParse(heightController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;
    int age = int.tryParse(ageController.text) ?? 0;

    if (height <= 0 || weight <= 0) {
      showResultDialog(
        "Error",
        "Height and Weight must be greater than 0",
        Colors.red,
      );
      return;
    }

    // ✅ Standard Medical Formula
    double bmi = weight / (height * height);

    String category;
    Color color;

    if (bmi < 18.5) {
      category = "Underweight";
      color = Colors.blue;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      category = "Normal weight";
      color = Colors.green;
    } else if (bmi >= 25 && bmi < 29.9) {
      category = "Overweight";
      color = Colors.orange;
    } else {
      category = "Obese";
      color = Colors.red;
    }

    String message = "Your BMI: ${bmi.toStringAsFixed(2)}\nCategory: $category";

    if (age < 18) {
      message +=
          "\n\nNote: For children and teens, BMI should be interpreted using age-based percentile charts.";
    }

    showResultDialog("BMI Result", message, color);
  }

  void showResultDialog(String title, String message, Color color) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: TextStyle(color: color)),
        content: Text(message, style: const TextStyle(fontSize: 16)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset('assets/images/bmi_bg.png', fit: BoxFit.cover),
          ),

          // Dark Overlay
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),

          // Main Content
          Center(
            child: SingleChildScrollView(
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "BMI Calculator",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      buildTextField("Age (years)", ageController),
                      const SizedBox(height: 15),

                      buildTextField(
                        "Height (meters) e.g. 1.70",
                        heightController,
                      ),
                      const SizedBox(height: 15),

                      buildTextField("Weight (kg)", weightController),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: calculateBMI,
                        child: const Text("Calculate BMI"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
