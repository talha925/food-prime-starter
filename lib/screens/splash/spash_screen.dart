import 'package:flutter/material.dart';
import 'package:food_prime_app/screens/premimum/premium_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../theme/style.dart';
import '../auth/auth_pages/auth_page.dart';

class SplashScreen extends StatefulWidget {
  final Widget child;
  const SplashScreen({super.key, required this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToCorrectScreen();
  }

  void _navigateToCorrectScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000));

    // Check if the user is authenticated
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is authenticated, navigate to PremiumScreen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const PremiumScreen()),
        (route) => false,
      );
    } else {
      // User is not authenticated, navigate to AuthPage
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const AuthPage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorED6E1B,
      body: Center(
        child: Image.asset("assets/app_logo.png"),
      ),
    );
  }
}
