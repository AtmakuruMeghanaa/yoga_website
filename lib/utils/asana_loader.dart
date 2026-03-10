import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<Map<String, String>>> loadAsanas() async {
  final manifestContent = await rootBundle.loadString('AssetManifest.json');
  final Map<String, dynamic> manifestMap = json.decode(manifestContent);

  final List<Map<String, String>> asanas = [];

  manifestMap.keys.forEach((path) {
    if (path.startsWith('assets/images/')) {
      final parts = path.split('/');
      if (parts.length >= 4) {
        final folder = parts[2]; // pose name
        final file = parts[3];

        if (file.startsWith('File1')) {
          // pick first image only
          asanas.add({"key": folder, "image": path});
        }
      }
    }
  });

  return asanas;
}
