import 'package:flutter/material.dart';
import 'package:store_app/UI/add_product_screen.dart';
import 'package:store_app/UI/cart_screen.dart';
import 'package:store_app/UI/home_page_screen.dart';
import 'package:store_app/UI/update_product_screen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProductScreen.id: (context) => UpdateProductScreen(),
        AddProductScreen.id:(context) => AddProductScreen(),
        CartScreen.id: (context) => const CartScreen()
      },
      initialRoute: HomePage.id));
}
