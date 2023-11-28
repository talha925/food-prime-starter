import 'package:flutter/material.dart';
import 'package:food_prime_app/screens/payment/payment_screen.dart';
import 'package:food_prime_app/theme/style.dart';
import 'package:food_prime_app/widget/button_container_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: Image.asset(
            "assets/word_app_logo.png",
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "2 items in the list card ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 3,
                        right: 3,
                      ), // Add space at the bottom of each item
                      child: _itmeCardWidget(
                        context,
                        image: "assets/pizza_popular_3.png",
                        title: "Pizza",
                        subtitle: "Time Food",
                        price: "\$49",
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Items",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(
                    "2",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery Fee",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(
                    "\$0.02",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[350],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(
                    "\$55.00",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonContainerWidget(
                title: "Check Out",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentScreen()));
                },
              ),
            ],
          ),
        ));
  }

  _itmeCardWidget(
    BuildContext context, {
    String? title,
    String? image,
    String? price,
    String? subtitle,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.17,
      width: double.infinity,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[350]!,
                offset: const Offset(0, 1),
                spreadRadius: 1.5,
                blurRadius: 3.5),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          children: [
            //image
            Image.asset(
              "$image",
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //title
                      Text("$title",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),

                      //close button
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: lightGreyColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Icon(
                          Icons.close,
                          color: primaryColorED6E1B,
                        ),
                      )
                    ],
                  ),
                  //subtitle
                  Text(
                    "$subtitle",
                  ),
                  const SizedBox(height: 5),
                  //price
                  Text(
                    "$price",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // remove item button
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1)),
                        child: const Center(
                          child: Icon(Icons.remove_outlined),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // text quantity
                      const Text("1"),
                      const SizedBox(width: 10),
                      //add item button
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1)),
                        child: const Center(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
