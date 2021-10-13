import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/product_provider.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/modules/view/pages/subcategorypage.dart';


class SubCategoryController extends GetxController {
  var isLoading = true.obs;
  var page = 1;
  var categoryId = 0.obs;
  ScrollController scrollController =  ScrollController();
  var isMoreDataAvilable = true.obs;
  var categoryproductList = List<dynamic>.empty(growable: true).obs;


  @override
  void onInit() {
    fetchProductsByCategory(1);
    super.onInit();
  }


  Future<void> fetchProductsByCategory(category_id) async {
    try {
      categoryId.value = category_id;
      print("majdSh");
      isLoading(true);
      var product = await ProductProvider.fetchProductsByCategoryId(
        page, category_id,);
      if (product != null) {
        categoryproductList.addAll(product.productData!);
        // print(categoryproductList!.length.toString()+"ىةىةىة");
      }
    } finally {
      isLoading(false);
    }
  }


  ///for pagination
  Future<void> getMoreTask(page) async {
    print("for pagination");
    var product = await ProductProvider.fetchProductsByCategoryId(
      page, categoryId,);
    if (product != null) {
      if (product.productData!.isNotEmpty) {
        isMoreDataAvilable(true);
        categoryproductList.addAll(product.productData!);
      }
      else {
        isMoreDataAvilable(false);
      }
    }
    else {
      isMoreDataAvilable(false);
    }
  }

  void paginateTask() {
    print("nkkkkkkkkkkk");


    scrollController.addListener(() {
      print(scrollController.position.pixels);
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reached end");
        page++;
        getMoreTask(page);
      }
    //   else {print("nkkkkkkkkkkk");}
    }

    );


// void setproduct(){
//   productData!.setcomments([Comment(id: 1)]);
//   print(productData!.comments!.length.toString());
// }
  }
}
