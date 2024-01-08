import 'package:flutter/material.dart';
import 'package:food_prime_app/screens/auth/auth_service/auth_service.dart';
import 'package:food_prime_app/screens/auth/login_screen.dart';
import 'package:food_prime_app/theme/style.dart';
import 'package:food_prime_app/widget/button_container_widget.dart';

import '../../widget/form_container_widget.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const SignUpPage({super.key, required this.showLoginPage});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _rememberMeCheckValue = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final lastNamecontroller = TextEditingController();
  final firstNamecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const FormContainerWidget(hintText: "Username"),
                const SizedBox(
                  height: 20,
                ),
                const FormContainerWidget(hintText: "Email"),
                const SizedBox(
                  height: 20,
                ),
                const FormContainerWidget(hintText: "Password"),
                const SizedBox(
                  height: 20,
                ),
                const FormContainerWidget(hintText: "Phone number"),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Checkbox(
                      onChanged: (value) {
                        setState(() {
                          _rememberMeCheckValue = value!;
                        });
                      },
                      value: _rememberMeCheckValue,
                    ),
                    Expanded(
                      child: RichText(
                        maxLines: 2,
                        text: const TextSpan(
                          text: "By signing up you accept the ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Team of service ",
                              style: TextStyle(color: primaryColorED6E1B),
                            ),
                            TextSpan(
                              text: "and ",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(color: primaryColorED6E1B),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonContainerWidget(
                  title: "Sign Up",
                  onTap: () {
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (_) => const PremiumScreen()),
                    //     (route) => false);

                    AuthServices().signUp(
                        context,
                        emailcontroller.text.trim(),
                        passwordcontroller.text.trim(),
                        confirmpasswordcontroller.text.trim());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account? ",
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                        (route) => false);
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 15, color: primaryColorED6E1B),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
