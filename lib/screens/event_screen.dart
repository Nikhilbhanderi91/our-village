import 'package:flutter/material.dart';
import 'package:ourvillage/theme/app_theme.dart';

class EventScreen extends StatefulWidget {
  final bool isEnglish;
  const EventScreen({super.key, this.isEnglish = true});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  String searchQuery = "";

  // Bilingual events data
  final List<Map<String, String>> events = [
    {
      "titleEn": "Village Fair",
      "titleGu": "ગામ મेला",
      "descriptionEn": "Annual fair with food, music & fun activities",
      "descriptionGu": "ખોરાક, સંગીત અને મજાની પ્રવૃત્તિઓ સાથે વાર્ષિક મેળો",
      "date": "2025-10-05",
    },
    {
      "titleEn": "Tree Plantation Drive",
      "titleGu": "વૃક્ષારોપણ અભિયાન",
      "descriptionEn": "Join hands to plant trees in the village area",
      "descriptionGu": "ગામના વિસ્તાર માં વૃક્ષો લગાવવા માટે સહભાગી થાઓ",
      "date": "2025-10-12",
    },
    {
      "titleEn": "Health Camp",
      "titleGu": "હેલ્થ કેમ્પ",
      "descriptionEn": "Free health checkup and awareness session",
      "descriptionGu": "મફત આરોગ્ય તપાસ અને જાગૃતિ સત્ર",
      "date": "2025-10-20",
    },
    {
      "titleEn": "Cultural Night",
      "titleGu": "સાંસ્કૃતિક રાત્રિ",
      "descriptionEn": "Traditional dances and performances by locals",
      "descriptionGu": "સ્થાનિક લોકો દ્વારા પરંપરાગત નૃત્યો અને પ્રદર્શન",
      "date": "2025-11-01",
    },
    {
      "titleEn": "Sports Day",
      "titleGu": "સ્પોર્ટ્સ ડે",
      "descriptionEn": "Fun sports activities for all age groups",
      "descriptionGu": "બધા વય જૂથ માટે મજેદાર રમત ગમત પ્રવૃત્તિઓ",
      "date": "2025-11-10",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredEvents = events.where((event) {
      final title = widget.isEnglish ? event["titleEn"]! : event["titleGu"]!;
      return title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEnglish ? "Events" : "ઇવેન્ટ્સ"),
        backgroundColor: AppTheme.primary,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: widget.isEnglish ? "Search events..." : "ઇવેન્ટ્સ શોધો...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppTheme.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Event List
          Expanded(
            child: ListView.builder(
              itemCount: filteredEvents.length,
              itemBuilder: (context, index) {
                final event = filteredEvents[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: AppTheme.surface,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    leading: const Icon(
                      Icons.event,
                      color: AppTheme.primary,
                    ),
                    title: Text(
                      widget.isEnglish ? event["titleEn"]! : event["titleGu"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.onBackground,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          widget.isEnglish
                              ? event["descriptionEn"]!
                              : event["descriptionGu"]!,
                          style: const TextStyle(color: AppTheme.onBackground),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Date: ${event["date"]}",
                          style: const TextStyle(color: AppTheme.primaryVariant),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}