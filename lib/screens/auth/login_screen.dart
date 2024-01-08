import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_prime_app/screens/auth/auth_service/auth_service.dart';
import 'package:food_prime_app/theme/style.dart';
import 'package:food_prime_app/widget/button_container_widget.dart';

import '../../util/error_notify.dart';
import '../../widget/form_container_widget.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? showSignUpPage;

  const LoginPage({super.key, this.showSignUpPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool _rememberMeCheckValue = false;

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
                  height: 40,
                ),
                const Center(
                    child: Icon(
                  Icons.lock,
                  size: 72,
                )),
                const Text(
                  "Log In",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormContainerWidget(
                  hintText: "Email or Username",
                  controller: emailcontroller,
                ),
                const SizedBox(
                  height: 20,
                ),
                FormContainerWidget(
                  hintText: "Password",
                  controller: passwordcontroller,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                            onChanged: (value) {
                              setState(() {
                                _rememberMeCheckValue = value!;
                              });
                            },
                            value: _rememberMeCheckValue,
                          ),
                          const Text(
                            "Remember me",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const Text(
                      "Forget Password",
                      style: TextStyle(color: primaryColorED6E1B, fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonContainerWidget(
                  title: "Log In",
                  onTap: () {
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (_) => const PremiumScreen()),
                    //     (route) => false);

                    if (emailcontroller.text.isEmpty) {
                      Message.toastMessage(
                        'Please enter email',
                      );
                    } else if (passwordcontroller.text.isEmpty) {
                      Message.toastMessage(
                        'Please enter password',
                      );
                    } else if (passwordcontroller.text.length < 6) {
                      Message.toastMessage(
                        'Please enter 6 digit password',
                      );
                    } else {
                      AuthServices().signIn(emailcontroller.text.trim(),
                          passwordcontroller.text.trim());
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("or"),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _optionSignIn(
                      color: redColor,
                      iconData: FontAwesomeIcons.google,
                    ),
                    _optionSignIn(
                      color: Colors.blue[900]!,
                      iconData: FontAwesomeIcons.facebook,
                    ),
                    _optionSignIn(
                      color: Colors.blue[600]!,
                      iconData: FontAwesomeIcons.linkedin,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account? ",
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                  onTap: () {
                    widget.showSignUpPage!();
                    // print("object");
                  },
                  child: const Text(
                    "Create account",
                    style: TextStyle(fontSize: 15, color: primaryColorED6E1B),
                  ))
            ],
          ),
        ],
      ),
    ));
  }

  Widget _optionSignIn({required IconData iconData, required Color color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 40,
      height: 40,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: color),
      child: Center(
        child: Icon(
          iconData,
          color: whiteColor,
        ),
      ),
    );
  }
}
