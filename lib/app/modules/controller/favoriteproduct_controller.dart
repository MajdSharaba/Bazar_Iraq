
import 'package:get/state_manager.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/product_provider.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/modules/view/pages/subcategorypage.dart';


class FavoriteProductController extends GetxController {
  var isLoading = true.obs;
  List<ProductData>? favoriteProductList;




  @override
  void onInit() {
    fetchFavoriteProducts();
    super.onInit();
  }

  void fetchFavoriteProducts() async {
    try {
      isLoading(true);
      var product = await ProductProvider.fetchFavoriteProducts();
      if (product != null) {
        favoriteProductList = product.productData;
        print(favoriteProductList!.length);
      }
    } finally {
      isLoading(false);
    }
  }
  deleteFromFavorite(int index) async {
    await ProductProvider.deleteFavoriteProduct(favoriteProductList![index].id);
    favoriteProductList!.removeAt(index);


    update();
  }
  addToFavorite(productData) {
    ProductProvider.addFavoriteProduct(productData.id.toString());
    favoriteProductList!.add(productData);

    update();
  }
}