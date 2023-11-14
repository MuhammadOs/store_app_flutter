import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/UI/home_page_screen.dart';
import 'package:store_app/UI/update_product_screen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProductScreen.id: (context) => UpdateProductScreen(),
      },
      initialRoute: HomePage.id));
}
