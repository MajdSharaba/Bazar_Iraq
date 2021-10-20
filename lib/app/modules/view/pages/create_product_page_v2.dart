import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/category.dart';
import 'package:pazar_iraq/app/modules/controller/categories_controller.dart';
import 'package:pazar_iraq/app/modules/controller/create_product_controller.dart';
import 'package:pazar_iraq/app/modules/view/widgets/categorycard.dart';

class CreateProductPageV2 extends StatelessWidget {
  CreateProductPageV2({Key? key, this.subCategoryList}) : super(key: key);
  final CreateProductController createProductController=Get.find();
  final CategoryController categoryController = Get.find();
  final List<CategoryElement>? subCategoryList;
  @override
  Widget build(BuildContext context) {
    List<CategoryElement>? categoryList = subCategoryList!.isEmpty
        ? categoryController.categoryelement
        : subCategoryList;
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(flip: false),
            child: Container(
              height: 150,
              decoration: BoxDecoration(gradient: linearGradientColor),
              child: const Center(
                  child: Text(
                "Create Product",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
          ),
          Expanded(
            child: AnimationLimiter(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  categoryList!.length,
                  (int index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: 2,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: CategoryCardForCreateProduct(
                            categoryElement: categoryList[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
