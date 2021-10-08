import 'package:http/http.dart' as http;
import 'package:pazar_iraq/app/model/product.dart';

class ProductProvider {
  static var client = http.Client();

  static Future<Product> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'http://192.168.1.12:8080/bazar-iraq/public/api/products?page=1&result_num=3'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return null!;
    }
  }

}
