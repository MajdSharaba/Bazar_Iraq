import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/model/productdetail.dart';
import 'package:pazar_iraq/app/modules/controller/productdetail_controller.dart';
import 'package:pazar_iraq/app/modules/view/pages/product_detail.dart';
import 'package:pazar_iraq/app/modules/view/widgets/title_text.dart';

class ProductCard extends StatelessWidget {
  final ProductData? product;

   ProductCard({ Key? key,this.product }) : super(key: key);
  final ProductDetailController productDetailController = Get.put(ProductDetailController());




  @override
  Widget build(BuildContext context) {

    return AspectRatio(
        aspectRatio: 1 / 1,
        child:  GestureDetector(
          onTap: () async {
              productDetailController.productDetailData.value= new ProductDetailData() ;
       productDetailController.fetchProductsDetail(product!.id);


        Get.to(ProductDetailPage());

          },
          child: Container(
            margin: EdgeInsets.only(right: 20, bottom: 25,left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [BoxShadow(
                offset: Offset(5, 10),
                blurRadius: 15,
                color: Colors.grey.shade200,
              )],
            ),
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [

                Container(
                  height: 150,
                  child: Stack(
                    children: [

                      Container(
                        width: double.infinity,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: product!.images!.isNotEmpty?Image.network(product!.images!.first.originalUrl!,fit: BoxFit.cover,):Image.asset("assets/jacket.png")
                        ),
                      ),
                      // Positioned(
                      //   left: 0,
                      //   top: 0,
                      //
                      //
                      //   child: IconButton(
                      //     icon: Icon(
                      //       product!.is_favorite! ? Icons.favorite : Icons.favorite,
                      //       color:
                      //       product!.is_favorite! ? Colors.red : Colors.grey,
                      //     ),
                      //     onPressed: () {
                      //
                      //     },
                      //   ),
                      // ),

                    ],
                  ),
                ),
                SizedBox(height: 0,),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TitleText(
                    text: product!.name!,
                    fontSize: 14,
                    color:Colors.black ,

                  ),
                ),

                SizedBox(height: 10,),
                product!.auction==null?
                TitleText(
                  text: "\$ " +product!.price.toString() + '.00',
                  fontSize: 14,
                  color:Colors.black ,

                ):TitleText(
                  text: "\$ " +product!.auction!.currentPrice.toString() + '.00',
                  fontSize: 14,
                  color:Colors.black ,

                ),


                SizedBox(height: 10,),
                product!.auction==null?
                Text(""):
                Row(
                  children:  [
                  Icon(Icons.alarm,size:10),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TitleText(
                      text: product!.auction!.remainingTime.toString(),
                      fontSize: 10,
                      color: Color(0xFFF75672) ,

                    ),
                  ),
            ]
                ),



              ],
            ),
          ),
        )
    );
  }
}