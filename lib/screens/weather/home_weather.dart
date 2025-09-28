import 'package:flutter/material.dart';
import 'details_weather.dart';

class HomeWeather extends StatelessWidget {
  const HomeWeather({super.key});

  @override
  Widget build(BuildContext context) {
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
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
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
            "Around the world",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 16),

          _buildCityWeather(
            "United Kingdom",
            "London",
            "Partly cloudy",
            "18°C",
          ),
          _buildCityWeather("Egypt", "Cairo", "Sunny", "30°C"),
          _buildCityWeather("USA", "New York", "Rainy", "22°C"),
          _buildCityWeather("Japan", "Tokyo", "Cloudy", "19°C"),
        ],
      ),
    );
  }

  Widget _buildCityWeather(
    String country,
    String city,
    String desc,
    String temp,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 4), blurRadius: 6),
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
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
              Text(
                city,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                desc,
                style: const TextStyle(color: Colors.black45, fontSize: 14),
              ),
            ],
          ),
          Text(
            temp,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
