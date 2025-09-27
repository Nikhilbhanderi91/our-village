import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import 'package:ourvillage/theme/app_theme.dart';
import 'package:ourvillage/screens/weather/weather_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  bool isEnglish = true;
  String searchQuery = "";
  late AnimationController _animationController;

  final List<Map<String, dynamic>> dashboardItems = [
    {"titleEn": "Events 📅", "titleGu": "ઇવેન્ટ્સ 📅", "icon": Icons.event},
    {
      "titleEn": "About Village 🏡",
      "titleGu": "ગામ વિષે 🏡",
      "icon": Icons.info,
    },
    {"titleEn": "Gallery 🖼️", "titleGu": "ગેલેરી 🖼️", "icon": Icons.photo},
    {"titleEn": "Weather ☀️", "titleGu": "હવામાન ☀️", "icon": Icons.wb_sunny},
    {
      "titleEn": "Contacts 📞",
      "titleGu": "સંપર્ક 📞",
      "icon": Icons.contact_phone,
    },
    {
      "titleEn": "Village Map 🗺️",
      "titleGu": "ગામ નકશો 🗺️",
      "icon": Icons.map,
    },
    {
      "titleEn": "Daily Quotes 💡",
      "titleGu": "દૈનિક કોટ્સ 💡",
      "icon": Icons.lightbulb,
    },
    {
      "titleEn": "Announcements 📢",
      "titleGu": "અધિસૂચનાઓ 📢",
      "icon": Icons.campaign,
    },
    {
      "titleEn": "Shops & Services 🛒",
      "titleGu": "શોપ્સ & સર્વિસિસ 🛒",
      "icon": Icons.store,
    },
    {"titleEn": "Education 🎓", "titleGu": "શિક્ષણ 🎓", "icon": Icons.school},
    {
      "titleEn": "Health 🏥",
      "titleGu": "આરોગ્ય 🏥",
      "icon": Icons.health_and_safety,
    },
    {
      "titleEn": "Jobs & Opportunities 💼",
      "titleGu": "જોબ્સ & મોકા 💼",
      "icon": Icons.work,
    },
    {
      "titleEn": "Transport 🚍",
      "titleGu": "પરિવહન 🚍",
      "icon": Icons.directions_bus,
    },
    {
      "titleEn": "Culture & Festivals 🎉",
      "titleGu": "સાંસ્કૃતિક & તહેવારો 🎉",
      "icon": Icons.celebration,
    },
    {
      "titleEn": "Tourism & Places 🌄",
      "titleGu": "પ્રદેશ & પ્રવાસ 🌄",
      "icon": Icons.landscape,
    },
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
    final filteredItems = dashboardItems.where((item) {
      final title = isEnglish ? item["titleEn"] : item["titleGu"];
      return title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.primary, AppTheme.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: const Offset(4, 4),
                  ),
                  BoxShadow(
                    color: Colors.white24,
                    blurRadius: 12,
                    offset: const Offset(-4, -4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEnglish
                        ? "Welcome to Our Village"
                        : "આપનું આપના ગામમાં સ્વાગત છે",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    isEnglish
                        ? "Explore events, services, news, gallery and much more. Stay connected with your village!"
                        : "ઇવેન્ટ્સ, સર્વિસિસ, સમાચાર, ગેલેરી અને વધુ શોધો. આપના ગામ સાથે કનેક્ટ રહો!",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Search Bar
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: isEnglish ? "Search..." : "શોધો...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Horizontal Featured / Highlights
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredItems.take(5).length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return highlightCard(item);
                },
              ),
            ),
            const SizedBox(height: 24),

            // Grid Section for rest
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredItems.length - 5 > 0
                  ? filteredItems.length - 5
                  : 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final item = filteredItems[index + 5];
                return dashboardCard(item);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget highlightCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        if (item["titleEn"] == "Weather ☀️") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WeatherScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(isEnglish ? item["titleEn"] : item["titleGu"]),
            ),
          );
        }
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppTheme.primary, AppTheme.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item["icon"], size: 36, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              isEnglish ? item["titleEn"] : item["titleGu"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        if (item["titleEn"] == "Weather ☀️") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WeatherScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(isEnglish ? item["titleEn"] : item["titleGu"]),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.primaryVariant,
              AppTheme.secondary.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white.withOpacity(0.2),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
