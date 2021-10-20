import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/product_provider.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/model/productdetail.dart';


class ProductDetailController extends GetxController {
  var isLoading = true.obs;
  var isfavorite = false.obs;
  late TextEditingController commentController = TextEditingController();

  var productDetailData = ProductDetailData().obs;
  var rating = 2.0;
  var comment = ''.obs;
  var commentVisabilte = false.obs;


  /////auction paramter
  var startPriceSliderValue = 0.0.obs;
  var bidPriceSliderValue = 0.0.obs;
  RxInt startDate = 0.obs;
  RxInt endDate = 0.obs;


  @override
  void onInit() {
    commentController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }


  void fetchProductsDetail(var id) async {
    try {
      print(id.toString() + "2222333333");
      isLoading(true);
      var productDetail = await ProductProvider.fetchProductsDetails(id);
      if (productDetail != null) {
        productDetailData.value = productDetail.productDetailData!;
        isfavorite.value = productDetail.productDetailData!.isFavorite!;
        print(productDetailData.value.name!+"majd");
      }
    } finally {
      ///
      isLoading(false);
    }
  }

  String? validateComment(String commentvalidate) {
    if (commentvalidate.length < 1) {
      return "please Enter comment";
    }
    else {
      return null;
    }
  }

  void addcomment() {
    if (commentController.text.isNotEmpty) {
      productDetailData.value.comments!.add(Comment(
          id: productDetailData.value.id!,
          comment: commentController.text,
          rating: rating.toString(),
          userId: productDetailData.value.userId));
      ProductProvider.addComment(
          productDetailData.value.id!.toString(), commentController.text,
          rating.toStringAsFixed(2),
          productDetailData.value.userId!.toString());
    }
  }

   addAuction(proudctId) {
    if(startDate>DateTime.now().millisecondsSinceEpoch&&endDate.value>startDate.value){
    ProductProvider.addAuctions(
        proudctId.toString(), startDate.toString(), endDate.toString(),
        startPriceSliderValue.toStringAsFixed(2), bidPriceSliderValue.toStringAsFixed(2));}
    else print("some thing");
  }
  void addBids(auction_id,current_price){




    ProductProvider.addBids(auction_id.toString(), current_price.toString());
    productDetailData.value.auct!.currentPrice=current_price.toString();
    update();
  }
  deletProduct(product_id){
    ProductProvider.deleteProduct(product_id);

  }


}