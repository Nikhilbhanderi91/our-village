import 'dart:async';
import 'package:flutter/material.dart';
import 'permission_weather.dart';

class SplashWeather extends StatefulWidget {
  const SplashWeather({super.key});

  @override
  State<SplashWeather> createState() => _SplashWeatherState();
}

class _SplashWeatherState extends State<SplashWeather> {
  @override
  void initState() {
    super.initState();
    // Navigate to PermissionWeather after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PermissionWeather()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/weather_logo.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Weatherly",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
