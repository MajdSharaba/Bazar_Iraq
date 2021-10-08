import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pazar_iraq/app/core/light_color.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/modules/controller/product_controller.dart';
import 'package:pazar_iraq/app/modules/view/pages/product_detail.dart';
import 'package:pazar_iraq/app/modules/view/widgets/title_text.dart';

class ProductCard extends StatelessWidget {
  final ProductController productController = Get.find();

  final ProductData? product;
  // final ValueChanged<Product>? onSelected;
   ProductCard({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(

        decoration:  BoxDecoration(
          border: Border.all( color:Color(0xfffbb448), width: 2),
          color: LightColor.background,
          borderRadius: BorderRadius.all(const Radius.circular(20)),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
          ],
        ),

        // margin: EdgeInsets.symmetric(vertical: product!.isSelected! ? 20 : 0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Positioned(
              //   left: 0,
              //   top: 0,
              //   child: IconButton(
              //     icon: Icon(
              //       product!.isliked! ? Icons.favorite : Icons.favorite_border,
              //       color:
              //           product!.isliked! ? LightColor.red : LightColor.iconColor,
              //     ),
              //     onPressed: () {},
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    // child: Container(
                    //   decoration: BoxDecoration(
                    //     gradient: linearGradientColor,borderRadius: BorderRadius.circular(360)
                    //   ),
                      child:Image.asset("assets/jacket.png") ,
                    //)
                  ),
                  // SizedBox(height: 5),
                  TitleText(
                    text: product!.name!,
                    fontSize: 10,
                  ),
                  // TitleText(
                  //   text: product!.,
                  //   fontSize:  10,
                  //   color: LightColor.orange,
                  // ),
                  TitleText(
                    text: product!.price.toString(),
                    fontSize:12,
                  ),
                ],
              ),
            ],
          ),
        )
      ),
       onTap:() async { productController.productData=product;
       productController.setproduct();

       Get.to(ProductDetailPage());
       },
    );
  }
}
