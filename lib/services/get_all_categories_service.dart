import 'package:store_app/api_class.dart';

class AllCategoriesService{
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await API().get(url: 'https://fakestoreapi.com/products/categories');
    print(data);
    return data;
}
}