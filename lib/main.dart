import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/about.dart';
import 'screens/asanas.dart';
import 'screens/bmi.dart';
import 'screens/stress.dart';
import 'screens/contact.dart';

void main() {
  runApp(const YogaApp()); // ✅ Must match class name
}

class YogaApp extends StatelessWidget {
  const YogaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yoga Awareness Portal',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/asanas': (context) => const AsanasPage(),
        '/bmi': (context) => const BMIPage(),
        '/stress': (context) => const StressPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}
