// CartPage.dart

import 'package:flutter/material.dart';
import 'package:food_prime_app/model/cart_item.dart';
import 'package:food_prime_app/screens/payment/payment_screen.dart';
import 'package:food_prime_app/widget/button_container_widget.dart';

class CartPage extends StatefulWidget {
  final List<CartItem> cart;

  const CartPage({Key? key, required this.cart}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double _calculateTotalPrice() {
    double total = 0.0;
    for (var item in widget.cart) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    void _removeItem(int index) {
      setState(() {
        widget.cart.removeAt(index);
      });
    }

    void _updateQuantity(int index, bool isIncrement) {
      setState(() {
        if (isIncrement) {
          widget.cart[index].quantity++;
        } else {
          if (widget.cart[index].quantity > 1) {
            widget.cart[index].quantity--;
          }
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/word_app_logo.png",
        ),
// Conditionally show the back button
        leading: Navigator.canPop(context)
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              )
            : null,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.cart.length} items in the cart",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.cart.length,
                itemBuilder: (context, index) {
                  CartItem item = widget.cart[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 3,
                      right: 3,
                    ),
                    child: _itemCardWidget(
                      context,
                      image: item.image,
                      title: item.title,
                      price: "\$${item.price}",
                      quantity: item.quantity,
                      onDelete: () {
                        _removeItem(index);
                      },
                      onRemove: () {
                        _updateQuantity(index, false);
                      },
                      onAdd: () {
                        _updateQuantity(index, true);
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Items",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    "${widget.cart.length}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Fee",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "\$${_calculateTotalPrice().toStringAsFixed(2)}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ButtonContainerWidget(
              title: "Check Out",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemCardWidget(BuildContext context,
      {required String title,
      required String image,
      required String price,
      required int quantity,
      required VoidCallback onDelete,
      required VoidCallback onRemove,
      required VoidCallback onAdd}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.17,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[350]!,
            offset: const Offset(0, 1),
            spreadRadius: 1.5,
            blurRadius: 3.5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 80, // Adjust the height as needed
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
                      Flexible(
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: onDelete,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Subtitle", // Add the actual subtitle if needed
                  ),
                  const SizedBox(height: 5),
                  Text(
                    price,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: onRemove,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1),
                          ),
                          child:
                              const Center(child: Icon(Icons.remove_outlined)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text("$quantity"),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: onAdd,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1),
                          ),
                          child: const Center(child: Icon(Icons.add)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
