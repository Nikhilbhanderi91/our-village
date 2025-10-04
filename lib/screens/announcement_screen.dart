import 'package:flutter/material.dart';
import 'package:ourvillage/theme/app_theme.dart';
import 'package:ourvillage/screens/dashboard_screen.dart';


class AnnouncementScreen extends StatelessWidget {
  final bool isEnglish;
  const AnnouncementScreen({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final announcements = [
      {
        "titleEn": "Community Meeting",
        "titleGu": "સમુદાય બેઠક",
        "descEn": "There will be a community meeting at 5 PM today in the main hall.",
        "descGu": "આજે મુખ્ય હોલમાં સાંજે 5 વાગ્યે સમુદાય બેઠક યોજાશે.",
        "date": "Sep 30, 2025",
      },
      {
        "titleEn": "Water Supply Update",
        "titleGu": "પાણી પુરવઠો અપડેટ",
        "descEn": "Water supply will be turned off tomorrow from 8 AM to 12 PM for maintenance.",
        "descGu": "રવિવારે 8 વાગ્યાથી 12 વાગ્યા સુધી રક્ષણ માટે પાણી પુરવઠો બંધ રહેશે.",
        "date": "Sep 29, 2025",
      },
      {
        "titleEn": "New Shop Opening",
        "titleGu": "નવું દુકાન ખુલ્યું",
        "descEn": "A new grocery shop has opened near the village entrance.",
        "descGu": "ગામના પ્રવેશદ્વાર નજીક નવી ગ્રોસરી દુકાન ખુલ્લી છે.",
        "date": "Sep 28, 2025",
      },
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(isEnglish ? "Announcements" : "અધિસૂચનાઓ"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppTheme.primary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final ann = announcements[index];
          return _buildAnnouncementCard(
            theme,
            isEnglish ? ann["titleEn"]! : ann["titleGu"]!,
            isEnglish ? ann["descEn"]! : ann["descGu"]!,
            ann["date"]!,
          );
        },
      ),
    );
  }

  Widget _buildAnnouncementCard(ThemeData theme, String title, String desc, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.colorScheme.onBackground)),
          const SizedBox(height: 6),
          Text(desc, style: TextStyle(fontSize: 14, color: theme.colorScheme.onBackground.withOpacity(0.7))),
          const SizedBox(height: 8),
          Text(date, style: TextStyle(fontSize: 12, color: theme.colorScheme.onBackground.withOpacity(0.5))),
        ],
      ),
    );
  }
}