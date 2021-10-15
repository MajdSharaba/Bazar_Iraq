import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/product_provider.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/model/productdetail.dart';


class ProductDetailController extends GetxController {
  var isLoading = true.obs;
  late TextEditingController commentController = TextEditingController();

  ProductDetailData? productDetailData;
   var rating = 2.0;
  var comment=''.obs;
  var commentVisabilte=false.obs;


  @override
  void onInit() {
    commentController =TextEditingController();

    super.onInit();
  }
  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }


  void fetchProductsDetail(var id) async {
    try {
      print(id.toString()+"2222333333");
      isLoading(true);
      var productDetail = await ProductProvider.fetchProductsDetails(id);
      if (productDetail != null) {
        productDetailData = productDetail.productDetailData;
        print(productDetailData!.name);
      }
    } finally {
     ///
      isLoading(false);
    }
  }
  String? validateComment(String commentvalidate ){
    if(commentvalidate.length<1){
      return "please Enter comment";
    }
    else{
      return null;
    }

  }
  void addcomment() {
    if (commentController.text.isNotEmpty) {
      productDetailData!.comments!.add(new Comment(id:productDetailData!.id!,comment:commentController.text,rating: rating.toString(),userId:  productDetailData!.userId   ));
      ProductProvider.addComment(
          productDetailData!.id!.toString(), commentController.text,
          rating.toStringAsFixed(2), productDetailData!.userId!.toString());
    }
  }
}
