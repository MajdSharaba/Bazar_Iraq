import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/product_provider.dart';
import 'package:pazar_iraq/app/model/attribute.dart';

class CreateProductController extends GetxController {
  RxBool isLoading=false.obs;
  RxInt categoryId = 7.obs;
  get categoryIdValue => categoryId.value;
  set categoryIdValue(value) => categoryId.value = value;
  final variables = [].obs;
  get getVariables => variables.value;
  set setVariables(value) => variables.value = value;
  final attributes = <DynamicAttribute>[].obs;
  get getAttributes => attributes.value;
  set setAttributes(value) => attributes.value = value;
  final ImagePicker _picker = ImagePicker();
  @override
  void onInit() {
    fetchAttributes();
    super.onInit();
  }

  generateVariables() {
    for (int i = 0; i < attributes.length; i++) {
      var var$i;
      variables.add(var$i);
    }
  }

 Future<List<XFile>?> getImages() async {
    return await _picker.pickMultiImage(maxHeight: 300,maxWidth: 300,imageQuality: 30);

  }
  Future<void> fetchAttributes() async {
    isLoading.value=true;
    attributes.clear();
    variables.clear();
    try {
      attributes.value =
      await ProductProvider().fetchAttributesForCategory(categoryId.value);
      print(attributes.length);
      generateVariables();
      update();
    } finally{
      isLoading.value=false;
    }

  }
  createProduct( String name,
      String categoryId,
      String price,
      List attributeId,
      List attributeValue,
      String key,
      String value,
      String user_id,
      List<XFile> images,
      String desc) async {
    isLoading(true);
    update();
    try {
      await ProductProvider().createProduct(name,categoryId, price, attributeId, attributeValue, key, value, user_id, images,desc);
      update();
    } finally{
      isLoading.value=false;
    }
  }


}
