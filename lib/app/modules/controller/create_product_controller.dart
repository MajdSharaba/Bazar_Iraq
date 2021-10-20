import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/product_provider.dart';
import 'package:pazar_iraq/app/model/attribute.dart';

class CreateProductController extends GetxController {
  RxBool isLoading=false.obs;
  RxInt categoryChildId = 7.obs;
  RxInt categoryParentId = 7.obs;
  get categoryChildIdValue => categoryChildId.value;
  set categoryChildIdValue(value) => categoryChildId.value = value;
  get categoryParentIdValue => categoryChildId.value;
  set categoryParentIdValue(value) => categoryChildId.value = value;
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
      await ProductProvider().fetchAttributesForCategory(categoryChildId.value,categoryParentId.value);
      print(attributes.length);
      generateVariables();
      update();
    } finally{
      isLoading.value=false;
    }

  }
  createProduct( String name,
      int categoryChildId,
      int categoryParentId,
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
      await ProductProvider().createProduct(name,categoryChildId,categoryParentId, price, attributeId, attributeValue, key, value, "2", images,desc);
      update();
    } finally{
      isLoading.value=false;
    }
  }


}
