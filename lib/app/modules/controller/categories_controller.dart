
import 'package:get/get.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/category_proveder.dart';
import 'package:pazar_iraq/app/model/category.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  List<CategoryElement>? categoryelement;

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  Future fetchCategory() async {
    try {
      isLoading(true);
      var category = await CategoryProveder.fetchCategories();
      if (category != null) {
        categoryelement = category.categoryElement;
        print(categoryelement!.length);
      }
    } finally {
      isLoading(false);
    }
  }
}