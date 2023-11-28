import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_prime_app/theme/style.dart';

import 'home_category/food/food_main_page.dart';
import 'home_category/grocery_and_fruit/grocery_and_fruit_main_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            _homeCategoryItemWidget(context,
                title: "Grocery & Fruits",
                description:
                    "Order fresh vegetables & fruits anytime, anywhere.",
                image: "assets/home_image_1.png", onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (_) => const GroceryAndFruitMainPage()));
            }),
            const SizedBox(
              height: 20,
            ),
            _homeCategoryItemWidget(context,
                title: "Food",
                description:
                    "Order from your favorite restaurants and home chefs.",
                image: "assets/home_image_2.png", onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (_) => const FoodMainPage()));
            }),
          ],
        ),
      ),
    );
  }

  _homeCategoryItemWidget(BuildContext context,
      {required String description,
      required String title,
      required String image,
      VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.20,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 1),
                  spreadRadius: 1.5,
                  blurRadius: 5.5,
                  color: Colors.grey[350]!)
            ]),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Image.asset(image),
            ],
          ),
        ),
      ),
    );
  }
}
