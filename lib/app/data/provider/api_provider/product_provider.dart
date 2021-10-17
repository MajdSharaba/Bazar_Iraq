import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:async/async.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/attribute.dart';
import 'package:pazar_iraq/app/model/jsonList.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/model/productdetail.dart';

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

  static Future<Product> fetchProductsByCategoryId(page, category_id,parent_id) async {
    print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"+category_id.toString()+parent_id.toString()
    );
    var response = await client.get(Uri.parse(
        'http://184.168.97.161/public/api/products?child_id=$category_id&parent_id=$parent_id&page=$page&result_num=7'));
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

  static Future<void> addComment( id,comment, rating,  userId) async {
    var url = Uri.parse('http://184.168.97.161/public/api/product/add_comment');
    var response = await http.post(url, body: {'product_id': id, 'comment': comment,'rating': rating,'user_id':userId});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  fetchAttributesForCategory(int categoryChildId, int categoryParentId) async {
    List<DynamicAttribute> attributes = [];
    try {
      response = await http.post(
        Uri.parse(baseUrl + "category/getattribute"),body: {
          "child_id" : categoryChildId.toString(),
           "category_id" : categoryParentId.toString()
      }
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
    List<JsonList>? attributeIdsValues=[] ;
    var list=[];
    for (int i = 0; i < attributeId.length; i++) {
      attributeIdsValues.add(JsonList(attributeId: attributeId[i], attributeValue: attributeValue[i]));
    }
    for (int i = 0; i < attributeIdsValues.length; i++) {
      list.add(jsonEncode(attributeIdsValues[i].toJson()));
    }
    return list;
  }

  createProduct(
      String name,
      String categoryId,
      String price,
      List attributeId,
      List attributeValue,
      String key,
      String value,
      String user_id,
      List<XFile> images,
      String desc) async {

    var attributes =
       convertListstoJson(attributeId, attributeValue, key, value);
    try {
      var uri = Uri.parse(baseUrl + "products");

// create multipart request
      var request =  http.MultipartRequest("POST", uri);
      Map<String, String> headers = {
        "Accept": "application/json",
      };

//add headers
      request.headers.addAll(headers);
      for (var file in images) {
        String fileName = file.path.split("/").last;
        var stream =  http.ByteStream(DelegatingStream.typed(file.openRead()));
        // get file length
        var length = await file.length(); //imageFile is your image file
        // multipart that takes file
        var multipartFileSign =  http.MultipartFile('images[]', stream, length,
            filename: fileName);
        request.files.add(multipartFileSign);
      }

//adding params
      request.fields['name'] = name;
      request.fields['category_id'] = categoryId;
      request.fields['price'] = price;
      request.fields['user_id'] = user_id;
      request.fields['desc'] = desc;
      request.fields['attributes'] = attributes.toString();


      var responseStream = await request.send();
      var response = await responseStream.stream.bytesToString();


      print(response.toString());


    } catch (ex) {
      print("dddd" + ex.toString());
    }
  }
}
