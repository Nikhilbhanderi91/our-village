import 'package:flutter/material.dart';
import 'package:ourvillage/theme/app_theme.dart';
import 'package:ourvillage/screens/dashboard_screen.dart';

class HomeWeather extends StatelessWidget {
  const HomeWeather({super.key});

  @override
  Widget build(BuildContext context) {
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
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
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
            "Around the world",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onBackground,
            ),
          ),

          const SizedBox(height: 12),

          _buildCityWeather(
            theme,
            "United Kingdom",
            "London",
            "Partly cloudy",
            "18°C",
          ),
          _buildCityWeather(theme, "Egypt", "Cairo", "Partly cloudy", "30°C"),
          _buildCityWeather(theme, "Mexico", "Alaska", "Sunny", "22°C"),
        ],
      ),
    );
  }

  Widget _buildCityWeather(
      ThemeData theme,
      String country,
      String city,
      String desc,
      String temp,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
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
                ),
              ),
              Text(
                desc,
                style: TextStyle(
                  color: theme.colorScheme.onBackground.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Text(
            temp,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}