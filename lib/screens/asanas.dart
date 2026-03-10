import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../language_provider.dart';
import '../translations.dart';

class AsanasPage extends StatelessWidget {
  const AsanasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final language = context.watch<LanguageProvider>().currentLanguage;
    final text = translations[language]!;

    final List<Map<String, String>> asanas = [
      {
        "name": text["surya"]!,
        "image":
            "https://images.unsplash.com/photo-1552286450-4a669f880062?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3VyeWElMjBuYW1hc2thcnxlbnwwfHwwfHx8MA%3D%3D",
        "benefits":
            "Improves flexibility, boosts blood circulation, strengthens muscles.",
      },
      {
        "name": text["vriksha"]!,
        "image":
            "https://plus.unsplash.com/premium_photo-1682093279549-04f9f3a90e09?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dnJpa3NoYXNhbmF8ZW58MHx8MHx8fDA%3D",
        "benefits":
            "Improves balance, strengthens legs, enhances concentration.",
      },
      {
        "name": text["bhujanga"]!,
        "image":
            "https://images.unsplash.com/photo-1717821552922-61e18814a44a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Ymh1amFuZ2FzYW5hfGVufDB8fDB8fHww",
        "benefits": "Strengthens spine, opens chest, relieves stress.",
      },
      {
        "name": text["tadasana"]!,
        "image":
            "https://plus.unsplash.com/premium_photo-1669446008075-ef763c28d75b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dGFkYXNhbmF8ZW58MHx8MHx8fDA%3D",
        "benefits": "Improves posture, strengthens legs, increases stability.",
      },
      {
        "name": text["trikonasana"]!,
        "image":
            "https://images.unsplash.com/photo-1767611097404-7b24671abf40?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dHJpa29uYXNhbmF8ZW58MHx8MHx8fDA%3D",
        "benefits":
            "Improves digestion, stretches muscles, increases flexibility.",
      },
      {
        "name": text["padmasana"]!,
        "image":
            "https://plus.unsplash.com/premium_photo-1663011335736-03b4aae89827?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cGFkbWFzYW5hfGVufDB8fDB8fHww",
        "benefits": "Calms mind, improves posture, helps meditation.",
      },
      {
        "name": text["vajrasana"]!,
        "image":
            "https://media.istockphoto.com/id/2219248999/photo/man-practicing-vajrasana-pose-on-yoga-mat-outdoors.webp?a=1&b=1&s=612x612&w=0&k=20&c=Of80wpTr7LlzM7-2MIXudLEz5MdzNRpLEK2gjRV9dnM=",
        "benefits": "Improves digestion, strengthens back, enhances breathing.",
      },
      {
        "name": text["shalabhasana"]!,
        "image":
            "https://media.istockphoto.com/id/470128462/photo/locust-position-yoga-class-exercise-studio.webp?a=1&b=1&s=612x612&w=0&k=20&c=AH-WogDXgXLaX4aVHQD9fjK5vxqYjpRkqfdCffKmruM=",
        "benefits": "Strengthens lower back, improves posture, tones abdomen.",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(text["exploreAsanas"]!),
        backgroundColor: const Color(0xFF4B7783),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Wrap(
            spacing: 25,
            runSpacing: 25,
            children: asanas.map((asana) {
              return Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// CLICKABLE IMAGE
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => Dialog(
                            child: InteractiveViewer(
                              child: Image.network(asana["image"]!),
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(18),
                        ),
                        child: Image.network(
                          asana["image"]!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    /// TEXT CONTENT
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            asana["name"]!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            asana["benefits"]!,
                            style: const TextStyle(fontSize: 14, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
