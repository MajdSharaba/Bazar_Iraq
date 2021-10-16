import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/product_provider.dart';
import 'package:pazar_iraq/app/model/product.dart';


class ProductPageController extends GetxController {
  var isLoading = true.obs;
  static const _pageSize = 6;
  var categoryId = 0.obs;
  var categoryproductList = List<dynamic>.empty(growable: true).obs;
  final PagingController<int, ProductData> pagingController =
  PagingController(firstPageKey: 0);
  ProductPageController({required this.categoryId});

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    print(categoryId.toString() + "........................");
    super.onInit();
  }

  @override
  void dispose() {
    pagingController.dispose();
    // scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ProductProvider.fetchProductsByCategoryId(
        pageKey, categoryId.value,);
      if (newItems != null) {
        final isLastPage = newItems.productData!.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(newItems.productData!);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(newItems.productData!, nextPageKey);
        }
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}












  // Future<void> fetchProductsByCategory(category_id) async {
  //   try {
  //     categoryId.value = category_id;
  //     print("majdSh");
  //     isLoading(true);
  //     var product = await ProductProvider.fetchProductsByCategoryId(
  //       page, category_id,);
  //     if (product != null) {
  //       categoryproductList.addAll(product.productData!);
  //       // print(categoryproductList!.length.toString()+"ىةىةىة");
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }



