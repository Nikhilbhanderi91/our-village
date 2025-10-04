import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF4CAF50);
  static const Color primaryVariant = Color(0xFF388E3C);
  static const Color secondary = Color(0xFF8BC34A);
  static const Color background = Color(0xFFF1F8E9);
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFF44336);
  static const Color onPrimary = Colors.white;
  static const Color onBackground = Color(0xFF333333);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: Colors.white,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onBackground,
      error: error,
      onError: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: onPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: onPrimary,
<<<<<<< HEAD
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
=======
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondary,
      foregroundColor: Colors.white,
    ),
  );
<<<<<<< HEAD
}
=======
}
>>>>>>> d832061e79b98c6213e9de65a183ec1f82ae884f
