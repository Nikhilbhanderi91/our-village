import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashWeather extends StatefulWidget {
  const SplashWeather({super.key});

  @override
  State<SplashWeather> createState() => _SplashWeatherState();
}

class _SplashWeatherState extends State<SplashWeather> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
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
            Lottie.asset(
              "assets/animations/Weather_Night-rain.json",
              height: 150,
              width: 150,
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
