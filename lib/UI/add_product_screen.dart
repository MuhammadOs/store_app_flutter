import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/UI/custom_widgets/custom_button.dart';
import 'package:store_app/UI/custom_widgets/custom_text_field.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/add_product_service.dart';

import 'home_page_screen.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({super.key});

  static String id = 'add_product';

  @override
  State<AddProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<AddProductScreen> {
  String? productName, desc, image, price;
  bool isLoading = false;
  ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
              )),
          title: const Text(
            "Add Product",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'Product Description',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'Product Price',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'Product Image',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButon(
                  text: "Add product",
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await addProduct(product!);
                      print("Product added successfully");
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                    Navigator.pushNamed(context, HomePage.id);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addProduct(ProductModel product) async {
    await AddProductService().addProduct(
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
