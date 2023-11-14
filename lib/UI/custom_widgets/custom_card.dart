import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/UI/update_product_screen.dart';
import 'package:store_app/models/product_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 20,
                  offset: Offset(1, 1))
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0,14),
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' "${product.price.toString()}",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: -50,
              right: 20,
              child: Image.network(product.image, height: 100,))
        ],
      ),
    );
  }
}
