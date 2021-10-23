import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:async/async.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/attribute.dart';
import 'package:pazar_iraq/app/model/jsonList.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/model/productdetail.dart';
import 'package:pazar_iraq/app/modules/view/widgets/snackbar.dart';

class ProductProvider {
  static var client = http.Client();
  var response;

  ///http://184.168.97.161/public/api/products?category_id=12
  ///// get last products

  static Future<Product> fetchProducts() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        var response = await client
            .get(Uri.parse('http://184.168.97.161/public/api/products?user_id=$user_id'));
        if (response.statusCode == 200) {
          var jsonString = response.body;
          return productFromJson(jsonString);
        } else {
          print('getLastProduct error 401 ');
          Get.snackbar("Error", "فشل الاتصال",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white);
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
      } catch (e) {
        print('getLastProduct error 401 ');
        // Get.snackbar("Error", "فشل الاتصال",
        //     snackPosition: SnackPosition.TOP,
        //     backgroundColor: Colors.red,
        //     colorText: Colors.white);
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
    } else {
      print('getLastProduct error 401 ');
      Get.snackbar("Error", "فشل الاتصال",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
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
  ///////////
  static Future<void> deleteProduct(product) async {
    var url = Uri.parse('http://184.168.97.161/public/api/product/delete');
    var response = await http.post(url, body: {
      'product': product.toString(),
      'user_id': user_id.toString(),
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  //////get product by category id

  static Future<Product> fetchProductsByCategoryId(
      page, category_id, parent_id) async {
    print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii" +
        category_id.toString() +
        parent_id.toString());
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        var response = await client.get(Uri.parse(
            'http://184.168.97.161/public/api/products?user_id=$user_id&child_id=$category_id&parent_id=$parent_id&page=$page&result_num=7'));
        if (response.statusCode == 200) {
          var jsonString = response.body;
          return productFromJson(jsonString);
        } else {
          print('getProductByCategory error 401 ');
          Get.snackbar("Error", "فشل الاتصال",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white);
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
      } catch (e) {
        print('getProductByCategory error 401 ');
        Get.snackbar("Error", "فشل الاتصال",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
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
    } else {
      print('getProductByCategory error 401 ');
      Get.snackbar("Error", "فشل الاتصال",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
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
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        var response = await client.get(
            Uri.parse('http://184.168.97.161/public/api/products/$id?user_id=$user_id'),
            headers: {
              HttpHeaders.acceptLanguageHeader: 'en',
            });
        //
        // var response = await http.get(url);

        if (response.statusCode == 200) {
          var jsonString = response.body;
          print(jsonString);
          return productDetailFromJson(jsonString);
        } else {
          print('getProudactsData error 401 ');
          Get.snackbar("Error", "فشل الاتصال",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white);
          return null!;
        }
      } catch (e) {
        print('getProudactsData error 401 ');
        Get.snackbar("Error", "فشل الاتصال",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        return null!;
      }
    } else {
      print('getProudactsData error 401 ');
      Get.snackbar("Error", "فشل الاتصال",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return null!;
    }
  }

  ////// add comment
  static Future<void> addComment(id, comment, rating, userId) async {
    var url = Uri.parse('http://184.168.97.161/public/api/product/add_comment');
    var response = await http.post(url, body: {
      'product_id': id,
      'comment': comment,
      'rating': rating,
      'user_id': userId
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static Future<void> addAuctions(
      productId, startDate, endDate, minAmount, step) async {
    ///productId,startDate, endDate,minAmount, step
    print(productId +
        "#" +
        startDate +
        "#" +
        endDate +
        "#" +
        minAmount +
        "#" +
        step);
    var url = Uri.parse('http://184.168.97.161/public/api/new-auction');
    var response = await http.post(url, body: {
      'product_id': productId.toString(),
      'min_amount': minAmount.toString(),
      'step': step.toString(),
      'start_date': startDate.toString(),
      'end_date': endDate.toString()
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static Future<Product> fetchFavoriteProducts() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        var response = await client.get(
            Uri.parse(
                'http://184.168.97.161/public/api/product/myfavoriteproduct/${user_id}'),
            headers: {
              HttpHeaders.acceptLanguageHeader: 'en',
            });
        //
        // var response = await http.get(url);

        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          print(json);
          return Product(
              productData: List<ProductData>.from(
                  json["allfavorite"].map((x) => ProductData.fromJson(x))));
        } else {
          print('getFavorite error 401 ');
          Get.snackbar("Error", "فشل الاتصال",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white);
          return new Product();
        }
      } catch (e) {
        print('getFavorite error 401 ');
        Get.snackbar("Error", "فشل الاتصال",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        return new Product();
      }
    } else {
      print('getFavorite error 401 ');
      Get.snackbar("Error", "فشل الاتصال",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return new Product();
    }

  }
  static Future<void> addFavoriteProduct(productId
      ) async {
    ///productId,startDate, endDate,minAmount, step

    var url = Uri.parse('http://184.168.97.161/public/api/product/addtofavorite');
    var response = await http.post(url, body: {
      'user_id': user_id.toString(),
      'product_id': productId,
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
//////////////// delete from favorite
  static Future<void> deleteFavoriteProduct(productId
      ) async {
    ///productId,startDate, endDate,minAmount, step

    var response = await client.get(Uri.parse(
       "http://184.168.97.161/public/api/product/deletefromfavorite/$productId/$user_id"));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
    ///////////////////////////////////////
  static Future<void> addBids(auctionId,currentPrice
      ) async {

    var url = Uri.parse('http://184.168.97.161/public/api/auction/addBid');
    print(currentPrice+"majd");
    var response = await http.post(url, body: {
      'user_id': user_id.toString(),
      'auction_id': auctionId,
      'current_price':currentPrice
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  fetchAttributesForCategory(int categoryChildId, int categoryParentId) async {
    List<DynamicAttribute> attributes = [];
    try {
      response =
          await http.post(Uri.parse(baseUrl + "category/getattribute"), body: {
        "child_id": categoryChildId.toString(),
        "category_id": categoryParentId.toString()
      });
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        var data = decodedJson["data"];
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
    List<JsonList>? attributeIdsValues = [];
    var list = [];
    for (int i = 0; i < attributeId.length; i++) {
      attributeIdsValues.add(JsonList(
          attributeId: attributeId[i], attributeValue: attributeValue[i]));
    }
    for (int i = 0; i < attributeIdsValues.length; i++) {
      list.add(jsonEncode(attributeIdsValues[i].toJson()));
    }
    return list;
  }

  createProduct(
      String name,
      int categoryCildId,
      int categoryParentId,
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
      request.fields['child_category'] = categoryCildId.toString();
      request.fields['parent_category'] = categoryParentId.toString();
      request.fields['price'] = price;
      request.fields['user_id'] = user_id;
      request.fields['desc'] = desc;
      request.fields['attributes'] = attributes.toString();


      var responseStream = await request.send();
      var response = await responseStream.stream.bytesToString();

      print(response.toString());



      print(response.toString());
    } catch (ex) {
      print("dddd" + ex.toString());
    }
  }
}
