
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pazar_iraq/app/model/category.dart';


class CategoryProveder{


  static var client = http.Client();


  static Future<Category> fetchCategories() async {
    var response = await client.get(Uri.parse(
        'http://184.168.97.161/public/api/category/allcategory'),
      headers: {
      HttpHeaders.acceptLanguageHeader: 'ar',
      },                    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return categoryFromJson(jsonString);
    } else {
      //show error message
      return new Category();
    }
  }
}