import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  bool isEnglish = true;
  late AnimationController _animationController;

  final List<Map<String, dynamic>> dashboardItems = [
    {"titleEn": "Events 📅", "titleGu": "ઇવેન્ટ્સ 📅", "icon": Icons.event},
    {"titleEn": "About Village 🏡", "titleGu": "ગામ વિષે 🏡", "icon": Icons.info},
    {"titleEn": "Gallery 🖼️", "titleGu": "ગેલેરી 🖼️", "icon": Icons.photo},
    {"titleEn": "Weather ☀️", "titleGu": "હવામાન ☀️", "icon": Icons.wb_sunny},
    {"titleEn": "Contacts 📞", "titleGu": "સંપર્ક 📞", "icon": Icons.contact_phone},
    {"titleEn": "Village Map 🗺️", "titleGu": "ગામ નકશો 🗺️", "icon": Icons.map},
    {"titleEn": "Daily Quotes 💡", "titleGu": "દૈનિક કોટ્સ 💡", "icon": Icons.lightbulb},
    {"titleEn": "Announcements 📢", "titleGu": "અધિસૂચનાઓ 📢", "icon": Icons.campaign},
    {"titleEn": "Shops & Services 🛒", "titleGu": "શોપ્સ & સર્વિસિસ 🛒", "icon": Icons.store},
    {"titleEn": "Education 🎓", "titleGu": "શિક્ષણ 🎓", "icon": Icons.school},
    {"titleEn": "Health 🏥", "titleGu": "આરોગ્ય 🏥", "icon": Icons.health_and_safety},
    {"titleEn": "Jobs & Opportunities 💼", "titleGu": "જોબ્સ & મોકા 💼", "icon": Icons.work},
    {"titleEn": "Transport 🚍", "titleGu": "પરિવહન 🚍", "icon": Icons.directions_bus},
    {"titleEn": "Culture & Festivals 🎉", "titleGu": "સાંસ્કૃતિક & તહેવારો 🎉", "icon": Icons.celebration},
    {"titleEn": "Tourism & Places 🌄", "titleGu": "પ્રદેશ & પ્રવાસ 🌄", "icon": Icons.landscape},
    {"titleEn": "Village Development 🛠️", "titleGu": "ગામ વિકાસ 🛠️", "icon": Icons.build},
    {"titleEn": "Agriculture 🌾", "titleGu": "કૃષિ 🌾", "icon": Icons.agriculture},
    {"titleEn": "Market Rates 💰", "titleGu": "બજાર ભાવ 💰", "icon": Icons.attach_money},
    {"titleEn": "Local Business 🏪", "titleGu": "સ્થાનિક બિઝનેસ 🏪", "icon": Icons.business},
    {"titleEn": "Sports & Youth ⚽", "titleGu": "ક્રીડા & યુવા ⚽", "icon": Icons.sports_soccer},
    {"titleEn": "Women Empowerment 👩‍🦱", "titleGu": "મહિલા સશક્તિકરણ 👩‍🦱", "icon": Icons.female},
    {"titleEn": "E-Governance 📑", "titleGu": "ઈ-સરકાર 📑", "icon": Icons.description},
    {"titleEn": "Blood Donation ❤️", "titleGu": "રક્તદાન ❤️", "icon": Icons.favorite},
    {"titleEn": "Library 📚", "titleGu": "લાઇબ્રેરી 📚", "icon": Icons.menu_book},
    {"titleEn": "Volunteer Work 🤝", "titleGu": "સેવાકાર્ય 🤝", "icon": Icons.volunteer_activism},
    {"titleEn": "Emergency Alerts 🚨", "titleGu": "જરૂરી એલર્ટ 🚨", "icon": Icons.warning},
    {"titleEn": "Lost & Found 🔎", "titleGu": "ગુમાયું & મળ્યું 🔎", "icon": Icons.search},
    {"titleEn": "Stories & Legends 📖", "titleGu": "વાર્તાઓ & લોકકથાઓ 📖", "icon": Icons.book},
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color containerColor = Colors.green.shade600;
    Color appBarColor = Colors.green.shade700;

    return Scaffold(
      drawer: const Sidebar(), // For demo, you can pass dynamic user info
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Our Village App"),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              setState(() {
                isEnglish = !isEnglish;
              });
            },
            tooltip: isEnglish ? "Switch to Gujarati" : "Switch to English",
          ),
        ],
      ),
      body: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: dashboardItems.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(0.05 * index, 1, curve: Curves.easeInOut),
                ),
              ),
              child: dashboardCard(index, containerColor),
            );
          },
        ),
      ),
    );
  }

  Widget dashboardCard(int index, Color containerColor) {
    final item = dashboardItems[index];

    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  isEnglish ? item["titleEn"] : item["titleGu"])),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 8,
              offset: const Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 8,
              offset: const Offset(-4, -4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white24,
              child: Icon(item["icon"], size: 32, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              isEnglish ? item["titleEn"] : item["titleGu"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 2,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}