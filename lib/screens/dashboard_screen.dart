import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import 'package:ourvillage/theme/app_theme.dart';
<<<<<<< HEAD
import 'package:ourvillage/screens/weather/weather_screen.dart';
=======
import 'contacts_screen.dart';
import 'event_screen.dart';
import 'about_village_screen.dart';
import 'package:ourvillage/screens/weather/home_weather.dart';
import 'package:ourvillage/screens/announcement_screen.dart';
import 'package:ourvillage/screens/village_map_screen.dart';
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f

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
<<<<<<< HEAD
    {"titleEn": "Events 📅", "titleGu": "ઇવેન્ટ્સ 📅", "icon": Icons.event},
    {
      "titleEn": "About Village 🏡",
      "titleGu": "ગામ વિષે 🏡",
      "icon": Icons.info,
    },
    {"titleEn": "Gallery 🖼", "titleGu": "ગેલેરી 🖼", "icon": Icons.photo},
    {"titleEn": "Weather ☀", "titleGu": "હવામાન ☀", "icon": Icons.wb_sunny},
    {
      "titleEn": "Contacts 📞",
      "titleGu": "સંપર્ક 📞",
      "icon": Icons.contact_phone,
    },
    {"titleEn": "Village Map 🗺", "titleGu": "ગામ નકશો 🗺", "icon": Icons.map},
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
=======
    {"titleEn": "Events", "titleGu": "ઇવેન્ટ્સ", "icon": Icons.event, "emoji": "📅", "route": "events"},
    {"titleEn": "About Village", "titleGu": "ગામ વિષે", "icon": Icons.info, "emoji": "🏡", "route": "about"},
    {"titleEn": "Gallery", "titleGu": "ગેલેરી", "icon": Icons.photo, "emoji": "🖼️"},
    // {"titleEn": "Weather", "titleGu": "હવામાન", "icon": Icons.wb_sunny, "emoji": "☀️", "route": "weather"},
    {"titleEn": "Contacts", "titleGu": "સંપર્ક", "icon": Icons.contact_phone, "emoji": "📞", "route": "contacts"},
    {"titleEn": "Village Map", "titleGu": "ગામ નકશો", "icon": Icons.map, "emoji": "🗺️", "route": "village_map"},
    {"titleEn": "Daily Quotes", "titleGu": "દૈનિક કોટ્સ", "icon": Icons.lightbulb, "emoji": "💡"},
    {"titleEn": "Announcements", "titleGu": "અધિસૂચનાઓ", "icon": Icons.campaign, "emoji": "📢", "route": "announcements"},
    {"titleEn": "Shops & Services", "titleGu": "શોપ્સ & સર્વિસિસ", "icon": Icons.store, "emoji": "🛒"},
    {"titleEn": "Education", "titleGu": "શિક્ષણ", "icon": Icons.school, "emoji": "🎓"},
    {"titleEn": "Health", "titleGu": "આરોગ્ય", "icon": Icons.health_and_safety, "emoji": "🏥"},
    {"titleEn": "Jobs & Opportunities", "titleGu": "જોબ્સ & મોકા", "icon": Icons.work, "emoji": "💼"},
    {"titleEn": "Transport", "titleGu": "પરિવહન", "icon": Icons.directions_bus, "emoji": "🚍"},
    {"titleEn": "Culture & Festivals", "titleGu": "સાંસ્કૃતિક & તહેવારો", "icon": Icons.celebration, "emoji": "🎉"},
    {"titleEn": "Tourism & Places", "titleGu": "પ્રદેશ & પ્રવાસ", "icon": Icons.landscape, "emoji": "🌄"},
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContactsScreen()),
        );
        break;
      case "events":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventScreen(isEnglish: isEnglish)),
        );
        break;
      case "about":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutVillageScreen(isEnglish: isEnglish)),
        );
        break;
      case "weather":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeWeather()),
        );
        break;
      case "announcements":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnnouncementScreen(isEnglish: isEnglish),
          ),
        );
        break;
      case "village_map":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VillageMapScreen()),
        );
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
<<<<<<< HEAD
        title: const Text("Our Village App"),
=======
        elevation: 0,
        title: Text(
          isEnglish ? "Our Village" : "અમારું ગામ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.language, color: Colors.white),
              onPressed: () {
                setState(() {
                  isEnglish = !isEnglish;
                });
              },
              tooltip: isEnglish ? "Switch to Gujarati" : "Switch to English",
            ),
          ),
        ],
      ),
<<<<<<< HEAD
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
=======
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.primary, AppTheme.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
<<<<<<< HEAD
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
=======
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
                ),
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))],
              ),
<<<<<<< HEAD
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
        if (item["titleEn"] == "Weather ☀") {
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
        if (item["titleEn"] == "Weather ☀") {
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
=======
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
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
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
                  Text(isEnglish ? "Quick Stats" : "ઝડપી આંકડા",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildStatCard(isEnglish ? "Active Events" : "સક્રિય ઇવેન્ટ્સ", "12", Icons.event_available, Colors.green),
                        const SizedBox(width: 12),
                        _buildStatCard(isEnglish ? "New Updates" : "નવી અપડેટ્સ", "5", Icons.update, Colors.blue),
                        const SizedBox(width: 12),
                        _buildStatCard(isEnglish ? "Services" : "સેવાઓ", "24", Icons.business_center, Colors.orange),
                        const SizedBox(width: 12),
                        _buildStatCard(isEnglish ? "Members" : "સભ્યો", "150+", Icons.people, Colors.purple),
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
                  Text(isEnglish ? "Categories" : "કેટેગરીઝ", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
                  Text("${filteredItems.length} ${isEnglish ? "items" : "આઇટમ્સ"}", style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.1,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final item = filteredItems[index];
                  return _buildCategoryCard(item, index);
                },
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
