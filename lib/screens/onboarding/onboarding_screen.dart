import 'package:flutter/material.dart';
import 'package:food_prime_app/screens/auth/auth_pages/main_page.dart';
import 'package:food_prime_app/screens/onboarding/onboarding_entity.dart';
import 'package:food_prime_app/theme/style.dart';
import 'package:food_prime_app/widget/button_container_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<OnBoardingEntity> onBoardingData = OnBoardingEntity.onBoardingData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            itemCount: onBoardingData.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 60),
                child: Column(
                  children: [
                    Image.asset("word_app_logo.png"),
                    const SizedBox(height: 60),
                    Image.asset("assets/${onBoardingData[index].image}"),
                    const SizedBox(height: 40),
                    Text(
                      "${onBoardingData[index].title}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${onBoardingData[index].description}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == 0
                                  ? primaryColorED6E1B
                                  : Colors.grey),
                        ),
                        Container(
                          height: 10,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == 1
                                  ? primaryColorED6E1B
                                  : Colors.grey),
                        ),
                        Container(
                          height: 10,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == 2
                                  ? primaryColorED6E1B
                                  : Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    index == 2
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ButtonContainerWidget(
                              title: 'Get Started',
                              hasIcon: true,
                              icon: Icons.arrow_forward_ios,
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MainPage()),
                                    (route) => false);
                              },
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            }));
  }
}
