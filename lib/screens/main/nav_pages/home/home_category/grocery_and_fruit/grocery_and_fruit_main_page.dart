import 'package:flutter/material.dart';
import 'package:food_prime_app/data/food_prime_data.dart';
import 'package:food_prime_app/screens/main/nav_pages/home/home_category/detail_page/detail_page.dart';
import 'package:food_prime_app/screens/search/search_page.dart';
import 'package:food_prime_app/theme/style.dart';

import '../../../../../../widget/search_widget.dart';

class GroceryAndFruitMainPage extends StatefulWidget {
  const GroceryAndFruitMainPage({super.key});

  @override
  State<GroceryAndFruitMainPage> createState() =>
      _GroceryAndFruitMainPageState();
}

class _GroceryAndFruitMainPageState extends State<GroceryAndFruitMainPage> {
  int _currentSelectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // search textfiled and mic IconButton
            Row(
              children: [
                Expanded(
                  child: SearchWidget(onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPage()));
                  }),
                ),
                const SizedBox(width: 10),

                //mic Icon Button
                Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColorED6E1B,
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Center(
                            child: Icon(
                          Icons.mic,
                          color: whiteColor,
                        ))))
              ],
            ),
            const SizedBox(height: 20),
            //Category Text
            const Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            //_singleCategoryItemWidget List
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _singleCategoryItemWidget(
                    title: "Fruits",
                    color: _currentSelectedCategory == 0
                        ? primaryColorED6E1B
                        : Colors.grey[400],
                    onTap: () {
                      setState(() {
                        _currentSelectedCategory = 0;
                      });
                    }),
                _singleCategoryItemWidget(
                    title: "Vegetables",
                    color: _currentSelectedCategory == 1
                        ? primaryColorED6E1B
                        : Colors.grey[400],
                    onTap: () {
                      setState(() {
                        _currentSelectedCategory = 1;
                      });
                    }),
                _singleCategoryItemWidget(
                    title: "Kitchen",
                    color: _currentSelectedCategory == 2
                        ? primaryColorED6E1B
                        : Colors.grey[400],
                    onTap: () {
                      setState(() {
                        _currentSelectedCategory = 2;
                      });
                    }),
              ],
            ),
            const SizedBox(height: 15),

            //category list
            _switchCategoryOnSelectedIndex(_currentSelectedCategory)
          ]),
        ));
  }

// category widget
  _singleCategoryItemWidget({
    VoidCallback? onTap,
    Color? color,
    String? title,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 110,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: color),
          child: Center(
            child: Text(
              "$title",
              style: const TextStyle(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }

  _switchCategoryOnSelectedIndex(int index) {
    switch (index) {
      case 0:
        {
          return _buildFruitsGridView();
        }
      case 1:
        {
          return _buildVegetablesGridView();
        }
      case 2:
        {
          return _buildKitchenGridView();
        }
    }
  }

// Fruit categories
  _buildFruitsGridView() {
    return Expanded(
        child: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.8),
      children: FRUIT_CATEGORY_LIST.map((fruit) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          data: fruit,
                          cart: [],
                        )));
          },
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/${fruit['image']}",
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 20,
                        child: Container(
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: redColor),
                          child: Center(
                            child: Text(
                              "${fruit['price']}",
                              style: const TextStyle(color: whiteColor),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Text("${fruit["title"]}")
            ],
          ),
        );
      }).toList(),
    ));
  }

// vegetable categories
  _buildVegetablesGridView() {
    return Expanded(
        child: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.8),
      children: VEGETABLES_CATEGORY_LIST.map((vegetable) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          data: vegetable,
                          cart: [],
                        )));
          },
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/${vegetable['image']}",
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 20,
                        child: Container(
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: redColor),
                          child: Center(
                            child: Text(
                              "${vegetable['price']}",
                              style: const TextStyle(color: whiteColor),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Text("${vegetable["title"]}")
            ],
          ),
        );
      }).toList(),
    ));
  }

// Kitchen categories
  _buildKitchenGridView() {
    return Expanded(
        child: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.8),
      children: KITCHEN_CATEGORY_LIST.map((kitchen) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          data: kitchen,
                          cart: [],
                        )));
          },
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/${kitchen['image']}",
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        bottom: 20,
                        right: 20,
                        child: Container(
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: redColor),
                          child: Center(
                            child: Text(
                              "${kitchen['price']}",
                              style: const TextStyle(color: whiteColor),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Text("${kitchen["title"]}")
            ],
          ),
        );
      }).toList(),
    ));
  }
}
