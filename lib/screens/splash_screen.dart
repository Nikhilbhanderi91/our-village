import 'package:flutter/material.dart';
import 'package:ourvillage/theme/app_theme.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            "assets/spalsh.jpeg", // <-- Your splash image
            fit: BoxFit.cover,
          ),

          // Dark overlay for readability
          Container(
            color: Colors.black.withOpacity(0.35),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),

                  // App Name
                  Text(
                    "Our Village App",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.6),
                          blurRadius: 6,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Long tagline / description
                  Text(
                    "Connecting People Together, Sharing Stories, "
                        "Celebrating Culture, and Building a Stronger "
                        "Community Across Every Village and Town.",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                      height: 1.5,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Get Started Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 8,
                        shadowColor: Colors.black45,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Started",
                            style: TextStyle(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: AppTheme.primary),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}