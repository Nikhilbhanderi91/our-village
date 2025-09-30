//about_village_screen.dart
import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import 'package:ourvillage/theme/app_theme.dart';

class AboutVillageScreen extends StatefulWidget {
  final bool isEnglish;
  const AboutVillageScreen({super.key, this.isEnglish = true});

  @override
  State<AboutVillageScreen> createState() => _AboutVillageScreenState();
}

class _AboutVillageScreenState extends State<AboutVillageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Go back to Dashboard
          },
        ),
        title: Text(
          widget.isEnglish ? "About Village" : "ગામ વિષે",
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.isEnglish
                  ? "Welcome to Our Village"
                  : "આપનું ગામમાં સ્વાગત છે",
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            Text(
              widget.isEnglish
                  ? "Our village is known for its beautiful landscapes, rich culture, and vibrant community life. It has schools, health centers, shops, and a variety of local events throughout the year."
                  : "અમારું ગામ સુંદર પરિસ્થિતિઓ, સમૃદ્ધ સંસ્કૃતિ અને જિવંત સમુદાય જીવન માટે જાણીતું છે. અહીં શાળાઓ, આરોગ્ય કેન્દ્રો, દુકાનો અને વર્ષ દરમિયાન વિવિધ સ્થાનિક ઇવેન્ટ્સ છે.",
              style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
            ),
            const SizedBox(height: 20),
            Text(
              widget.isEnglish ? "Key Highlights" : "મુખ્ય હાઇલાઇટ્સ",
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 12),
            _buildHighlight(
                widget.isEnglish ? "Schools & Education" : "શાળાઓ અને શિક્ષણ",
                widget.isEnglish
                    ? "Our village has multiple schools providing quality education for children."
                    : "અમારા ગામમાં બાળકો માટે ગુણવત્તાયુક્ત શિક્ષણ પૂરૂ પાડતી અનેક શાળાઓ છે."),
            _buildHighlight(
                widget.isEnglish ? "Healthcare" : "આરોગ્ય",
                widget.isEnglish
                    ? "Health centers and clinics ensure proper medical care for all residents."
                    : "આરોગ્ય કેન્દ્રો અને ક્લિનિક્સ તમામ નિવાસીઓ માટે યોગ્ય સારવાર સુનિશ્ચિત કરે છે."),
            _buildHighlight(
                widget.isEnglish ? "Culture & Festivals" : "સંસ્કૃતિ અને તહેવારો",
                widget.isEnglish
                    ? "The village celebrates local festivals and cultural events with enthusiasm."
                    : "ગામ સ્થાનિક તહેવારો અને સાંસ્કૃતિક ઇવેન્ટ્સ ઉત્સાહથી ઉજવે છે."),
            _buildHighlight(
                widget.isEnglish ? "Tourist Attractions" : "પ્રવાસી આકર્ષણો",
                widget.isEnglish
                    ? "Natural landscapes and historical places attract visitors throughout the year."
                    : "સુંદર પ્રાકૃતિક દૃશ્યો અને ઐતિહાસિક સ્થળો વર્ષ દરમિયાન પ્રવાસીઓને આકર્ષે છે."),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlight(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.primary)),
          const SizedBox(height: 4),
          Text(description,
              style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.5)),
        ],
      ),
    );
  }
}