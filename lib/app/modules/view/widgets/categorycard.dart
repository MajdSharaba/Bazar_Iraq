
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/category.dart';
import 'package:pazar_iraq/app/modules/controller/product_controller.dart';
import 'package:pazar_iraq/app/modules/controller/productpage_controller.dart';
import 'package:pazar_iraq/app/modules/view/pages/productpage.dart';
import 'package:pazar_iraq/app/modules/view/pages/subcategorypage.dart';

class CategoryCard extends StatelessWidget {
  final CategoryElement? categoryElement;
    CategoryCard({Key? key,required this.categoryElement}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    return
      InkWell(
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      height: deviceHeight * .137 < 160 ? deviceHeight * .137 : 160,
                      width: deviceWidth * .5 < 250 ? deviceWidth * .5 : 250,
                      //   child: Image.asset(image,fit: BoxFit.cover,)
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:categoryElement!=null? NetworkImage(categoryElement!.imageUrl!):NetworkImage("https://th.bing.com/th/id/OIP.hV6MoBaE8NYeMCugmhd7_QHaEo?pid=ImgDet&rs=1"), scale: 1)),
                    ),
                  ),
                  Positioned(
                    height: 60,
                    width: deviceWidth * .5 < 240 ? deviceWidth * .5 : 240,
                    left: 5,
                    bottom: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.black12],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    ),
                  ),
                  Positioned(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          //decoration: BoxDecoration(
                          //   shape: BoxShape.rectangle,
                          //   color: Colors.black.withOpacity(.4),
                          //  borderRadius: BorderRadius.all(Radius.circular(10))
                          // ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                categoryElement!=null?categoryElement!.name!:"no name",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              // Text(
                              //   category.monthyear!,
                              //   style: const TextStyle(
                              //       fontSize: 14,
                              //       fontWeight: FontWeight.w400,
                              //       color: Colors.white),
                              // ),
                            ],
                          ),
                        ),
                        // Container(
                        //   padding:
                        //   const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        //   decoration: const BoxDecoration(
                        //       shape: BoxShape.rectangle,
                        //       color: Colors.white,
                        //       borderRadius:
                        //       BorderRadius.all(Radius.circular(10))),
                        //   child: Text(
                        //     categoryElement.discount! ,
                        //     style: const TextStyle(
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.w400,
                        //         color: Colors.black),
                        //   ),
                        // )
                      ],
                    ),
                    left: 10,
                    bottom: 10,
                    right: 15,
                  )
                ],
              )),
          // Row(
          //   mainAxisSize: MainAxisSize.max,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Text("\$ " + '${(category.newprice)}',
          //         style: const TextStyle(
          //             color: Colors.black,
          //             fontWeight: FontWeight.bold,
          //             fontStyle: FontStyle.italic)),
          //     SizedBox(
          //       width: deviceWidth * 0.08,
          //     ),
          //     Text("\$ " + '${(category.oldprice)}',
          //         style: const TextStyle(
          //             color: Colors.black87,
          //             fontWeight: FontWeight.w400,
          //             fontStyle: FontStyle.italic)),
          //   ],
          // )
        ],
      ),
      onTap: (){
        // final ProductPageController productpageController = Get.put(ProductPageController(categoryId:1.obs));
        if(categoryElement!.children!.isEmpty){
          // productpageController.fetchProductsByCategory(categoryElement!.id!);
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => ProductPage(categoryElemen:categoryElement)));
        }
        else{
    Navigator.of(context).push(
    MaterialPageRoute(
    builder: (context) => SubCategoryPage(categoryElemen:categoryElement)));
    }

        }


        // subCategoryController.fetchProductsByCategory(categoryElement!.id!);
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //       builder: (context) => SubCategoryPage(categoryElemen:categoryElement)));

    );
  }
}
