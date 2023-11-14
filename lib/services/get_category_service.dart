import 'package:store_app/api_class.dart';
import 'package:store_app/models/product_model.dart';

class CategoryProductsService {
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryName}) async {
    List<dynamic> data = await API()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
