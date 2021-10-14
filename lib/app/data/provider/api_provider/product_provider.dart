import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/attribute.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/model/productdetail.dart';
import 'package:pazar_iraq/app/modules/controller/create_product_controller.dart';

class ProductProvider {
  static var client = http.Client();
  var response;

  ///http://184.168.97.161/public/api/products?category_id=12
  static Future<Product> fetchProducts() async {
    var response = await client
        .get(Uri.parse('http://184.168.97.161/public/api/products'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return Product(productData: <ProductData>[
        ProductData(
          id: 1,
          name: "problem",
          price: "",
          userId: null,
          categoryId: null,
          productType: null,
          storeId: null,
          createdAt: null,
          updatedAt: null,
          isFeatured: null,
          images: [
            Imagee(
                originalUrl:
                    "https://th.bing.com/th/id/OIP.hV6MoBaE8NYeMCugmhd7_QHaEo?pid=ImgDet&rs=1")
          ],
          des: null,
        )
      ]);
    }
  }

  static Future<Product> fetchProductsByCategoryId(page, category_id) async {
    var response = await client.get(Uri.parse(
        'http://184.168.97.161/public/api/products?category_id=12&page=$page&result_num=7'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return Product(productData: <ProductData>[
        ProductData(
          id: 1,
          name: "problem",
          price: "",
          userId: null,
          categoryId: null,
          productType: null,
          storeId: null,
          createdAt: null,
          updatedAt: null,
          isFeatured: null,
          images: [
            Imagee(
                originalUrl:
                    "https://th.bing.com/th/id/OIP.hV6MoBaE8NYeMCugmhd7_QHaEo?pid=ImgDet&rs=1")
          ],
          des: null,
        )
      ]);
    }
  }

  static Future<ProductDetail> fetchProductsDetails(var id) async {
    var url = Uri.parse('http://184.168.97.161/public/api/products/$id');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return productDetailFromJson(jsonString);
    } else {
      //show error message
      return null!;
    }
  }

  static Future<void> addComment(var id, comment, rating) async {
    var url = Uri.parse(
        'http://192.168.1.12:8080/bazar-iraq/public/api/product/add_comment');
    var response = await http.post(url,
        body: {'product_id': id, 'comment': comment, 'rating': rating});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  fetchAttributesForCategory(int categoryId) async {
    List<DynamicAttribute> attributes = [];
    try {
      response = await http.get(
        Uri.parse(baseUrl + "category/getattribute/$categoryId"),
      );
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        var data = decodedJson["all_attribute"];
        data.forEach((element) {
          attributes.add(DynamicAttribute.fromJson(element));
        });
      } else {
        //show error message
        return null!;
      }
    } catch (ex) {
      print("fetchAttributesForCategory  " + ex.toString());
    }
    return attributes;
  }

  convertListstoJson(
      List attributeId, List attributeValue, String key, String value) {
    List<dynamic>? attributeIdsValues = [];
    for (int i = 0; i < attributeId.length; i++) {
      var attribueIdElement=attributeId[i];
      var attributeValuElement=attributeValue[i];
      var json={"$key: $attribueIdElement", "$value: $attributeValuElement"};
      attributeIdsValues
          .add(json);
    }
    return attributeIdsValues;
  }

  createProduct(
      String name,
      String price,
      List attributeId,
      List attributeValue,
      String key,
      String value,
      String user_id,
          List<XFile> images,
      String desc) async {
    final CreateProductController createProductController = Get.find();
    List attributes =
        convertListstoJson(attributeId, attributeValue, key, value);
    try {
      response = await http.post(Uri.parse(baseUrl + "products"), body: {
        "name": name,
        "category_id": createProductController.categoryId.value,
        "price": price,
        "images[]": images,
        "attributes": attributes,
        "user_id": user_id.toString(),
        "desc":desc
      });
      print(response.toString());
    } catch (ex) {
      print("dddd"+ex.toString());
    }
  }
}
