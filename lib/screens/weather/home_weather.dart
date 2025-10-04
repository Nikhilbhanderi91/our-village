import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'details_weather.dart';
=======
import 'package:ourvillage/theme/app_theme.dart';
import 'package:ourvillage/screens/dashboard_screen.dart';
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f

class HomeWeather extends StatelessWidget {
  const HomeWeather({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text("Weatherly"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings, color: Colors.white),
=======
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Today's Weather"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
<<<<<<< HEAD
          // Current location weather card
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DetailsWeather()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.deepPurple.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.3),
                    offset: const Offset(0, 6),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gaza, Palestine",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "27°C",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Sunny",
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                    ],
                  ),
                  Icon(Icons.wb_sunny, size: 80, color: Colors.yellow),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),

          const Text(
=======
          // Current location weather
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Palestine",
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary.withOpacity(0.7),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Gaza",
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sunny",
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary.withOpacity(0.7),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Text(
                  "27°C",
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          Text(
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
            "Around the world",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
<<<<<<< HEAD
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 16),

          _buildCityWeather(
=======
              color: theme.colorScheme.onBackground,
            ),
          ),

          const SizedBox(height: 12),

          _buildCityWeather(
            theme,
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
            "United Kingdom",
            "London",
            "Partly cloudy",
            "18°C",
          ),
<<<<<<< HEAD
          _buildCityWeather("Egypt", "Cairo", "Sunny", "30°C"),
          _buildCityWeather("USA", "New York", "Rainy", "22°C"),
          _buildCityWeather("Japan", "Tokyo", "Cloudy", "19°C"),
=======
          _buildCityWeather(theme, "Egypt", "Cairo", "Partly cloudy", "30°C"),
          _buildCityWeather(theme, "Mexico", "Alaska", "Sunny", "22°C"),
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
        ],
      ),
    );
  }

  Widget _buildCityWeather(
<<<<<<< HEAD
    String country,
    String city,
    String desc,
    String temp,
  ) {
=======
      ThemeData theme,
      String country,
      String city,
      String desc,
      String temp,
      ) {
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
<<<<<<< HEAD
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 4), blurRadius: 6),
=======
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                country,
<<<<<<< HEAD
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
              Text(
                city,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
=======
                style: TextStyle(
                  color: theme.colorScheme.onBackground.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
              Text(
                city,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onBackground,
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
                ),
              ),
              Text(
                desc,
<<<<<<< HEAD
                style: const TextStyle(color: Colors.black45, fontSize: 14),
=======
                style: TextStyle(
                  color: theme.colorScheme.onBackground.withOpacity(0.6),
                  fontSize: 14,
                ),
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
              ),
            ],
          ),
          Text(
            temp,
<<<<<<< HEAD
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
=======
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primaryContainer,
            ),
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
