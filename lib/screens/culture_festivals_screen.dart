import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CultureFestivalsScreen extends StatefulWidget {
  final bool isEnglish;
  const CultureFestivalsScreen({super.key, this.isEnglish = true});

  @override
  State<CultureFestivalsScreen> createState() => _CultureFestivalsScreenState();
}

class _CultureFestivalsScreenState extends State<CultureFestivalsScreen> {
  String searchQuery = "";

  // Example data for culture & festivals
  final List<Map<String, String>> festivals = [
    {"titleEn": "Navratri", "titleGu": "નવરાત્રી", "date": "Oct 1 - Oct 10", "location": "Gujarat"},
    {"titleEn": "Diwali", "titleGu": "દિવાળી", "date": "Nov 2", "location": "Gujarat"},
    {"titleEn": "Rath Yatra", "titleGu": "રથ યાત્રા", "date": "Jul 5", "location": "Puri"},
    {"titleEn": "Uttarayan", "titleGu": "ઉત્તરાયણ", "date": "Jan 14", "location": "Gujarat"},
    {"titleEn": "Holi", "titleGu": "હોળી", "date": "Mar 25", "location": "Gujarat"},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredFestivals = festivals.where((festival) {
      final text =
      "${festival["titleEn"]} ${festival["titleGu"]} ${festival["date"]} ${festival["location"]}".toLowerCase();
      return text.contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEnglish ? "Culture & Festivals" : "સાંસ્કૃતિક & તહેવારો"),
        backgroundColor: AppTheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Bar
            TextField(
              onChanged: (value) => setState(() => searchQuery = value),
              decoration: InputDecoration(
                hintText: widget.isEnglish ? "Search festival..." : "તહેવાર શોધો...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),

            // Festival List
            Expanded(
              child: ListView.builder(
                itemCount: filteredFestivals.length,
                itemBuilder: (context, index) {
                  final festival = filteredFestivals[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppTheme.primary.withOpacity(0.2),
                        child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(widget.isEnglish ? festival["titleEn"]! : festival["titleGu"]!),
                      subtitle: Text("${festival["date"]} • ${festival["location"]}"),
                      trailing: const Icon(Icons.celebration, color: Colors.orange),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}