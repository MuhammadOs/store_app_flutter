import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/UI/update_product_screen.dart';
import 'package:store_app/models/basket_products.dart';
import 'package:store_app/models/product_model.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.product, this.atBasket = true});

  final ProductModel product;
  final bool atBasket;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: widget.product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
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
                      widget.product.title.substring(0, 14),
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' "${widget.product.price.toString()}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                        widget.atBasket
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    basketProducts.contains(widget.product)
                                        ? ()
                                        : basketProducts.add(widget.product);
                                  });
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.cartShopping,
                                ))
                            : const SizedBox()
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
              child: Image.network(
                widget.product.image,
                height: 100,
              ))
        ],
      ),
    );
  }
}
