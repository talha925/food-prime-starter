import 'package:flutter/material.dart';
import 'package:food_prime_app/theme/style.dart';

import '../../widget/button_container_widget.dart';
import '../../widget/form_container_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Select Payment Method title
            const Text(
              "Select Payment Method",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                _selctPaymentMethodWidget(image: "assets/master_card.png"),
                const SizedBox(width: 10),
                _selctPaymentMethodWidget(image: "assets/visa.png"),
                const SizedBox(width: 10),
                _selctPaymentMethodWidget(image: "assets/paypal.png"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Card Number",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //Enter your card number textfiled
            const FormContainerWidget(hintText: "Enter your card number"),
            const SizedBox(
              height: 20,
            ),

            const Text(
              "Expiration date",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //Enter your data time year
            const FormContainerWidget(hintText: "MM/YY/DD"),
            const SizedBox(
              height: 20,
            ),

            //Scre
            const Text(
              "Security Code",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //Enter your security code textfiled
            const FormContainerWidget(hintText: "Enter your security code"),
            const SizedBox(
              height: 20,
            ),
            // Button Order now
            ButtonContainerWidget(
              title: "Order now",
              onTap: () {
                //press opne the dialog box
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: lightGreyColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        width: double.infinity,
                        height: 380,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Image.asset("assets/order_successful.png"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Order has been\nsuccessful.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                                "You can track the delivery in the\n'Orders' section.",
                                textAlign: TextAlign.center),
                            const SizedBox(
                              height: 25,
                            ),
                            ButtonContainerWidget(
                              title: "Continue Shopping",
                              width: 200,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _selctPaymentMethodWidget({String? image}) {
    return Expanded(
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Image.asset("$image"),
        ),
      ),
    );
  }
}
