import 'dart:async';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:lottie/lottie.dart';
=======
import 'permission_weather.dart';
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f

class SplashWeather extends StatefulWidget {
  const SplashWeather({super.key});

  @override
  State<SplashWeather> createState() => _SplashWeatherState();
}

class _SplashWeatherState extends State<SplashWeather> {
  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
=======
    // Navigate to PermissionWeather after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PermissionWeather()),
      );
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
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
<<<<<<< HEAD
            Lottie.asset(
              "assets/animations/Weather_Night-rain.json",
              height: 150,
              width: 150,
=======
            Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/weather_logo.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
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
