import 'package:flutter/material.dart';
import 'package:food_prime_app/screens/auth/signup_screen.dart';

import '../login_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  void toogleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showSignUpPage: toogleScreens);
    } else {
      return SignUpPage(
        showLoginPage: toogleScreens,
      );
    }
  }
}
