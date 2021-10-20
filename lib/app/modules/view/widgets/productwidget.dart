
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/languages/locale_keys.g.dart';
import 'package:pazar_iraq/app/modules/controller/product_controller.dart';
import 'package:pazar_iraq/app/modules/view/widgets/productcard.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20, left: 20),
        height: 330,
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text(LocaleKeys.lastProducts.translations(), style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                  const Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Text('View all ', style: TextStyle(color: Colors.black, fontSize: 14),),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Obx(() {
                if (productController.isLoading.value)
                  return const Center(child: CircularProgressIndicator());
                else {
                  return Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productController.productList!.length,
                          itemBuilder: (context, index) {
                            return
                              ProductCard (product :productController.productList![index]);
                          }
                      )
                  );}})
            ]
        )
    );

  }
}
