import 'dart:ui';
import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'package:ourvillage/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String correctEmail = "user12.com";
  final String correctPassword = "1234";

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
      return;
    }

    if (email == correctEmail && password == correctPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email or password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background splash image
          Image.asset(
            'assets/spalsh.jpeg', // Your splash image
            fit: BoxFit.cover,
          ),

          // Optional dark overlay for contrast
          Container(
            color: Colors.black.withOpacity(0.2),
          ),

          // Centered glass login container
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // subtle blur
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3), // more solid
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person, size: 80, color: AppTheme.primary),
                        const SizedBox(height: 20),
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primary,
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon:
                            Icon(Icons.email, color: AppTheme.primary),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppTheme.primary),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon:
                            Icon(Icons.lock, color: AppTheme.primary),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppTheme.primary),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primary,
                              padding:
                              const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: login,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                color: AppTheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}