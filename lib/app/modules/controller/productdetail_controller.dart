import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/product_provider.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/model/productdetail.dart';


class ProductDetailController extends GetxController {
  var isLoading = true.obs;
  late TextEditingController commentController = TextEditingController();

  ProductDetailData? productDetailData;
   var rating = 0.0;
  var comment=''.obs;


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
  void addcomment(){
    print(rating);
    ///ProductProvider.addComment(productDetailData!.id,comment.value , rating.value);
  }

}
