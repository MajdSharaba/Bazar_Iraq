
import 'package:get/state_manager.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/product_provider.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/modules/view/pages/subcategorypage.dart';


class ProductController extends GetxController {
  var isLoading = true.obs;
  static const _pageSize = 20;
  List<ProductData>? productList;
  // List<ProductData>? categoryproductList;
  ProductData? productData;



  @override
  void onInit() {

    fetchProducts();
    super.onInit();
  }

   fetchProducts() async {
    try {

      isLoading(true);
      var product = await ProductProvider.fetchProducts();
      if (product != null) {
        productList = product.productData;
        print(productList!.length);
        update();
      }
    } finally {
      isLoading(false);
    }
  }
  // Future<void> fetchProductsByCategory(category_id) async{
  //  try  {
  //     isLoading(true);
  //     var product = await ProductProvider.fetchProductsByCategoryId( category_id);
  //     if (product != null) {
  //       categoryproductList = product.productData;
  //       print(categoryproductList!.length.toString()+"ىةىةىة");
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }
  // void setproduct(){
  //   productData!.setcomments([Comment(id: 1)]);
  //   print(productData!.comments!.length.toString());
  // }
}

