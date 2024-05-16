import 'package:flutter/material.dart';
import 'package:store_app/UI/custom_widgets/custom_card.dart';
import 'package:store_app/models/basket_products.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  static String id = 'cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basket"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, bottom: 8),
            child: Text(
              basketProducts.length.toString(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20),
        child: GridView.builder(
          itemCount: basketProducts.length,
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 60, // Adjusted mainAxisSpacing
          ),
          itemBuilder: (context, index) {
            return CustomCard(
              product: basketProducts[index],
              atBasket: false,
            );
          },
        ),
      ),
    );
  }
}
