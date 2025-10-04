import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import 'package:ourvillage/theme/app_theme.dart';
import 'contacts_screen.dart';
import 'event_screen.dart';
import 'about_village_screen.dart';
import 'package:ourvillage/screens/weather/home_weather.dart';
import 'package:ourvillage/screens/announcement_screen.dart';
import 'package:ourvillage/screens/village_map_screen.dart';
import 'package:ourvillage/screens/transport_screen.dart';
import 'package:ourvillage/screens/culture_festivals_screen.dart';
import 'package:ourvillage/screens/education_screen.dart';

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

  final List<Color> _colorPalette = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.indigo,
    Colors.pink,
    Colors.cyan,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.brown,
  ];

  final List<Map<String, dynamic>> dashboardItems = [
    {"titleEn": "Events", "titleGu": "ઇવેન્ટ્સ", "icon": Icons.event, "emoji": "📅", "route": "events"},
    {"titleEn": "About Village", "titleGu": "ગામ વિષે", "icon": Icons.info, "emoji": "🏡", "route": "about"},
    {"titleEn": "Gallery", "titleGu": "ગેલેરી", "icon": Icons.photo, "emoji": "🖼️"},
    {"titleEn": "Contacts", "titleGu": "સંપર્ક", "icon": Icons.contact_phone, "emoji": "📞", "route": "contacts"},
    {"titleEn": "Village Map", "titleGu": "ગામ નકશો", "icon": Icons.map, "emoji": "🗺️", "route": "village_map"},
    {"titleEn": "Daily Quotes", "titleGu": "દૈનિક કોટ્સ", "icon": Icons.lightbulb, "emoji": "💡"},
    {"titleEn": "Announcements", "titleGu": "અધિસૂચનાઓ", "icon": Icons.campaign, "emoji": "📢", "route": "announcements"},
    {"titleEn": "Shops & Services", "titleGu": "શોપ્સ & સર્વિસિસ", "icon": Icons.store, "emoji": "🛒"},
    {"titleEn": "Education", "titleGu": "શિક્ષણ", "icon": Icons.school, "emoji": "🎓", "route": "education"},
    {"titleEn": "Health", "titleGu": "આરોગ્ય", "icon": Icons.health_and_safety, "emoji": "🏥"},
    {"titleEn": "Jobs & Opportunities", "titleGu": "જોબ્સ & મોકા", "icon": Icons.work, "emoji": "💼"},
    {"titleEn": "Transport", "titleGu": "પરિવહન", "icon": Icons.directions_bus, "emoji": "🚌", "route": "transport"},
    {"titleEn": "Culture & Festivals", "titleGu": "સાંસ્કૃતિક & તહેવારો", "icon": Icons.celebration, "emoji": "🎉", "route": "culture_festivals"},
    {"titleEn": "Tourism & Places", "titleGu": "પ્રદેશ & પ્રવાસ", "icon": Icons.landscape, "emoji": "🌄"},
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

  void _handleItemTap(Map<String, dynamic> item) {
    switch (item["route"]) {
      case "contacts":
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactsScreen()));
        break;
      case "events":
        Navigator.push(context, MaterialPageRoute(builder: (context) => EventScreen(isEnglish: isEnglish)));
        break;
      case "about":
        Navigator.push(context, MaterialPageRoute(builder: (context) => AboutVillageScreen(isEnglish: isEnglish)));
        break;
      case "weather":
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeWeather()));
        break;
      case "announcements":
        Navigator.push(context, MaterialPageRoute(builder: (context) => AnnouncementScreen(isEnglish: isEnglish)));
        break;
      case "village_map":
        Navigator.push(context, MaterialPageRoute(builder: (context) => const VillageMapScreen()));
        break;
      case "transport":
        Navigator.push(context, MaterialPageRoute(builder: (context) => TransportScreen(isEnglish: isEnglish)));
        break;
      case "culture_festivals":
        Navigator.push(context, MaterialPageRoute(builder: (context) => CultureFestivalsScreen(isEnglish: isEnglish)));
        break;
      case "education":
        Navigator.push(context, MaterialPageRoute(builder: (context) => EducationScreen(isEnglish: isEnglish)));
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isEnglish ? item["titleEn"] : item["titleGu"]),
            backgroundColor: _getItemColor(dashboardItems.indexOf(item)),
            behavior: SnackBarBehavior.floating,
          ),
        );
        break;
    }
  }
  Color _getItemColor(int index) {
    return _colorPalette[index % _colorPalette.length];
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
        elevation: 0,
        title: Text(
          isEnglish ? "Our Village" : "અમારું ગામ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.language, color: Colors.white),
              onPressed: () => setState(() => isEnglish = !isEnglish),
              tooltip: isEnglish ? "Switch to Gujarati" : "Switch to English",
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEnglish ? "Welcome to Our Village! 👋" : "આપનું આપના ગામમાં સ્વાગત છે! 👋",
                    style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, height: 1.3),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isEnglish
                        ? "Explore everything your village has to offer"
                        : "તમારા ગામમાં ઉપલબ્ધ બધું જ શોધો",
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
                    ),
                    child: TextField(
                      onChanged: (value) => setState(() => searchQuery = value),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: isEnglish ? "Search features..." : "ફીચર્સ શોધો...",
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                        prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.7)),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Quick Stats
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEnglish ? "Quick Stats" : "ઝડપી આંકડા",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => _handleItemTap(dashboardItems.firstWhere((e) => e["route"] == "events")),
                          child: _buildStatCard(isEnglish ? "Active Events" : "સક્રિય ઇવેન્ટ્સ", "12", Icons.event_available, Colors.green),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () => _handleItemTap(dashboardItems.firstWhere((e) => e["route"] == "announcements")),
                          child: _buildStatCard(isEnglish ? "New Updates" : "નવી અપડેટ્સ", "5", Icons.update, Colors.blue),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () => _handleItemTap(dashboardItems.firstWhere((e) => e["route"] == "services", orElse: () => {})),
                          child: _buildStatCard(isEnglish ? "Services" : "સેવાઓ", "24", Icons.business_center, Colors.orange),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () => _handleItemTap(dashboardItems.firstWhere((e) => e["route"] == "members", orElse: () => {})),
                          child: _buildStatCard(isEnglish ? "Members" : "સભ્યો", "150+", Icons.people, Colors.purple),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Categories
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(isEnglish ? "Categories" : "કેટેગરીઝ",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
                  Text("${filteredItems.length} ${isEnglish ? "items" : "આઇટમ્સ"}",
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // Category Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 1.1),
              delegate: SliverChildBuilderDelegate(
                    (context, index) => _buildCategoryCard(filteredItems[index], index),
                childCount: filteredItems.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [BoxShadow(color: color.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey.shade600, fontWeight: FontWeight.w500), maxLines: 2),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> item, int index) {
    final color = _getItemColor(index);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () => _handleItemTap(item),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.8), color.withOpacity(0.4)],
            ),
            boxShadow: [BoxShadow(color: color.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))],
          ),
          child: Stack(
            children: [
              Positioned(
                right: -10,
                bottom: -10,
                child: Opacity(opacity: 0.1, child: Icon(item["icon"], size: 80, color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                          child: Icon(item["icon"], color: Colors.white, size: 24),
                        ),
                        Text(item["emoji"] ?? "📱", style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isEnglish ? item["titleEn"] : item["titleGu"],
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15, height: 1.2),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Container(height: 3, width: 30, decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(2))),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}