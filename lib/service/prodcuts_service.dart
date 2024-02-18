import 'package:bloc_state_management/model/product_model.dart';
import 'package:dio/dio.dart';

getProducts() async {
  try {
    Dio dio = Dio();

    Response response = await dio.get("https://dummyjson.com/products");

    if (response.statusCode == 200) {
      List<ProductModel> products = List.generate(
          response.data['products'].length,
          (index) => ProductModel.fromMap(response.data['products'][index]));
      return products;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
