
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/modules/controller/product_controller.dart';
import 'package:pazar_iraq/app/modules/view/widgets/productcard.dart';

class ProductWidget extends StatelessWidget {
   ProductWidget({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());


  @override
  Widget build(BuildContext context) {
     return Column(
         mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                // SizedBox(
                //   width: width! * 0.05,
                // ),
                Text(
                  "Latest products",
                  style: TextStyle(color:Colors.black, fontSize: 14),
                ),
                Spacer(),
                Text("VIEW ALL",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                )
              ],
            ),
          ),
          Obx(() {
            if (productController.isLoading.value)
              return Center(child: CircularProgressIndicator());
            else {
              return Container(
             margin: const EdgeInsets.symmetric(vertical: 10),
             width: deviceWidth,
             height: deviceHeight * .25,
             child: GridView(
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 1,
                   childAspectRatio: 4 / 3,
                   mainAxisSpacing: 30,
                   crossAxisSpacing: 20),
               padding: const EdgeInsets.only(left: 20),
               scrollDirection: Axis.horizontal,
               children: productController.productList!
                   .map(
                     (product) =>
                     ProductCard(
                       product: product,

                     ),
               )
                   .toList(),
             ),
              );
            }
          })]);
  }
}