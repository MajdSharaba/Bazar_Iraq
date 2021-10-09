
import 'package:get/state_manager.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/product_provider.dart';
import 'package:pazar_iraq/app/model/product.dart';


class ProductController extends GetxController {
  var isLoading = true.obs;
   List<ProductData>? productList;
  ProductData? productData;


  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var product = await ProductProvider.fetchProducts();
      if (product != null) {
        productList = product.productData;
        print(productList!.length);
      }
    } finally {
      isLoading(false);
    }
  }
  // void setproduct(){
  //   productData!.setcomments([Comment(id: 1)]);
  //   print(productData!.comments!.length.toString());
  // }
}

