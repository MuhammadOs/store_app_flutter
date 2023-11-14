import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/UI/custom_widgets/custom_button.dart';
import 'package:store_app/UI/custom_widgets/custom_text_field.dart';
import 'package:store_app/UI/home_page_screen.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});

  static String id = 'update_product';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, desc, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
              )),
          title: Text(
            "Update Product",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
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
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButon(
                  text: "Update",
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print("Product updated successfully");
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                    //Navigator.pushNamed(context, HomePage.id);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null? product.title : productName!,
        price: price == null? product.price.toString() : price!,
        desc: desc == null? product.description : desc!,
        image: image == null? product.image : image!,
        category: product.category);
  }
}
