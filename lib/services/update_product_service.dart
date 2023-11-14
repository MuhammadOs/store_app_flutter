import '../api_class.dart';
import '../models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required String title,
        required String price,
        required String desc,
        required String image,
        required int id,
        required String category,}) async {
    Map<String, dynamic> data = await API().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
    });
    return ProductModel.fromJson(data);
  }
}