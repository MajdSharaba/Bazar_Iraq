
import 'package:http/http.dart' as http;
import 'package:pazar_iraq/app/model/category.dart';


class CategoryProveder{


  static var client = http.Client();


  static Future<Category> fetchCategories() async {
    var response = await client.get(Uri.parse(
        'http://184.168.97.161/public/api/category/allcategory'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return categoryFromJson(jsonString);
    } else {
      //show error message
      return new Category();
    }
  }
}