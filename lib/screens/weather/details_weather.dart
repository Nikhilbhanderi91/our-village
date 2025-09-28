import 'package:flutter/material.dart';

class DetailsWeather extends StatelessWidget {
  const DetailsWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text("Friday, 27 Sep"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.calendar_today, color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Main weather card
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.deepPurple.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: const [
                Icon(Icons.wb_sunny, size: 80, color: Colors.yellow),
                SizedBox(height: 12),
                Text(
                  "Gaza, Palestine",
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
                SizedBox(height: 6),
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
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStat("Wind", "14 km/h"),
              _buildStat("Humidity", "60%"),
              _buildStat("Pressure", "29 inHg"),
            ],
          ),

          const SizedBox(height: 24),

          const Text(
            "Hourly Forecast",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          _buildHourlyForecast("12:00", Icons.wb_sunny, "27°C"),
          _buildHourlyForecast("15:00", Icons.wb_cloudy, "25°C"),
          _buildHourlyForecast("18:00", Icons.wb_twighlight, "22°C"),
          _buildHourlyForecast("21:00", Icons.nights_stay, "20°C"),
        ],
      ),
    );
  }

  Widget _buildStat(String title, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 4), blurRadius: 6),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildHourlyForecast(String time, IconData icon, String temp) {
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
          Text(
            time,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Icon(icon, color: Colors.deepPurple),
          Text(
            temp,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
