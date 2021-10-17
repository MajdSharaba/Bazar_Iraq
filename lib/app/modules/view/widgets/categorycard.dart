
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/category.dart';
import 'package:pazar_iraq/app/modules/controller/categories_controller.dart';
import 'package:pazar_iraq/app/modules/controller/create_product_controller.dart';
import 'package:pazar_iraq/app/modules/view/pages/create_product_page.dart';

import 'package:pazar_iraq/app/modules/view/pages/create_product_page_v2.dart';
import 'package:pazar_iraq/app/modules/view/pages/productpage.dart';
import 'package:pazar_iraq/app/modules/view/pages/subcategorypage.dart';

class CategoryCard extends StatelessWidget {
  final CategoryElement? categoryElement;
  final int? parentId;
  final CreateProductController createProductController=Get.find();
    CategoryCard({Key? key,required this.categoryElement, this.parentId,}) : super(key: key);




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
                    //right: 0,
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

                      ],
                    ),
                    left: 10,
                    bottom: 10,
                    right: 15,
                  )
                ],
              )),

        ],
      ),
      onTap: (){
        // final ProductPageController productpageController = Get.put(ProductPageController(categoryId:1.obs));
        if(categoryElement!.children!.isEmpty){
          // productpageController.fetchProductsByCategory(categoryElement!.id!);
          // Navigator.of(context).push(
          //     MaterialPageRoute(
          //         builder: (context) => ProductPage(categoryElemen:categoryElement,parentId:parentId)));
          Get.to(ProductPage(categoryElemen:categoryElement,parentId:parentId));
        }
        else{
    Navigator.of(context).push(
    MaterialPageRoute(
    builder: (context) => SubCategoryPage(categoryElemen:categoryElement)));
    }


        // if(categoryElement!.children!.isEmpty){
        //   subCategoryController.fetchProductsByCategory(categoryElement!.id);
        // }
      //   final ProductPageController productPageController = Get.put(ProductPageController(categoryId: categoryId, parentid: parentid));
      //
      //   subCategoryController.fetchProductsByCategory(categoryElement!.id!);
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //         builder: (context) => SubCategoryPage(categoryElemen:categoryElement)));
      },
    );
  }
}

class CategoryCardForCreateProduct extends StatelessWidget {
  final CategoryElement? categoryElement;
   CategoryCardForCreateProduct({Key? key, this.categoryElement}) : super(key: key);
  final CategoryController categoryController = Get.find();
  final CreateProductController createProductController=Get.find();
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:categoryElement!=null? NetworkImage(categoryElement!.imageUrl!):NetworkImage("https://th.bing.com/th/id/OIP.hV6MoBaE8NYeMCugmhd7_QHaEo?pid=ImgDet&rs=1"), scale: 1)),
                      ),
                    ),
                    Positioned(
                      height: 60,
                      width: deviceWidth * .5 < 240 ? deviceWidth * .5 : 240,
                      left: 5,
                      //right: 0,
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

                              ],
                            ),
                          ),

                        ],
                      ),
                      left: 10,
                      bottom: 10,
                      right: 15,
                    )
                  ],
                )),
          ],
        ),
        onTap: (){

          if(categoryElement!.children!.isEmpty){
            categoryController.childCategoryId=categoryElement!.id!;
            createProductController.categoryChildId.value = categoryElement!.id!;
            createProductController.fetchAttributes();
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => CreateProductPage()));

          }
          else{
            categoryController.parentCategoryId=categoryElement!.id!;
            createProductController.categoryParentId.value = categoryElement!.id!;
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => CreateProductPageV2(subCategoryList: categoryElement!.children,)));
          }

        },
      );
  }
}


