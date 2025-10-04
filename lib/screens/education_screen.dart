import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EducationScreen extends StatelessWidget {
  final bool isEnglish;
  const EducationScreen({super.key, this.isEnglish = true});

  @override
  Widget build(BuildContext context) {
    // Example data
    final List<Map<String, String>> educationList = [
      {"title": "Primary School", "details": "Village Primary School, Classes 1-5"},
      {"title": "High School", "details": "Village High School, Classes 6-12"},
      {"title": "College", "details": "Nearby College for Higher Studies"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(isEnglish ? "Education" : "શિક્ષણ"),
        backgroundColor: AppTheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: educationList.length,
          itemBuilder: (context, index) {
            final item = educationList[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.school, color: AppTheme.primary),
                title: Text(isEnglish ? item["title"]! : _translateEducation(item["title"]!)),
                subtitle: Text(isEnglish ? item["details"]! : _translateEducation(item["details"]!)),
              ),
            );
          },
        ),
      ),
    );
  }

  // Simple translation helper (example)
  String _translateEducation(String text) {
    // You can replace this with proper Gujarati translation
    switch (text) {
      case "Primary School":
        return "પ્રાથમિક શાળા";
      case "High School":
        return "ઉચ્ચતર માધ્યમિક શાળા";
      case "College":
        return "કોલેજ";
      case "Village Primary School, Classes 1-5":
        return "ગામની પ્રાથમિક શાળા, ધોરણ 1-5";
      case "Village High School, Classes 6-12":
        return "ગામની ઉચ્ચતર માધ્યમિક શાળા, ધોરણ 6-12";
      case "Nearby College for Higher Studies":
        return "ઉચ્ચ શિક્ષણ માટેની નજીકની કોલેજ";
      default:
        return text;
    }
  }
}