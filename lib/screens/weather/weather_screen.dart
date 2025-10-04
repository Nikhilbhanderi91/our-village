import 'package:flutter/material.dart';
import 'package:ourvillage/screens/weather/splash_weather.dart';
<<<<<<< HEAD
import 'onboarding_weather.dart';
import 'permission_weather.dart';
import 'home_weather.dart';
=======
import 'package:ourvillage/screens/weather/onboarding_weather.dart';
import 'package:ourvillage/screens/weather/permission_weather.dart';
import 'package:ourvillage/screens/weather/home_weather.dart';
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
import 'package:ourvillage/screens/weather/details_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashWeather(),
        '/onboarding': (context) => const OnboardingWeather(),
        '/permission': (context) => const PermissionWeather(),
        '/home': (context) => const HomeWeather(),
        '/details': (context) => const DetailsWeather(),
      },
    );
  }
}
