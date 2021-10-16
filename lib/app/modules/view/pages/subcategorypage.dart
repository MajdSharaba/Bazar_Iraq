import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/category.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/modules/controller/product_controller.dart';
import 'package:pazar_iraq/app/modules/controller/productpage_controller.dart';
import 'package:pazar_iraq/app/modules/view/widgets/categorycard.dart';
import 'package:pazar_iraq/app/modules/view/widgets/productcard.dart';
import 'package:pazar_iraq/app/modules/view/widgets/title_text.dart';


class SubCategoryPage extends StatelessWidget {
  final CategoryElement? categoryElemen;
   SubCategoryPage({Key? key,this.categoryElemen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var conntroller;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFCFCFC),
       appBar: AppBar(
         elevation: 0,
         backgroundColor: Colors.transparent,
         leading:BackButton(),
         centerTitle: true,
         title:   TitleText(
           text:categoryElemen!.name,
           fontSize: 30,
         ),

       ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          // controller: conntroller,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: deviceHeight / 3 + 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // MySearch(),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image:  DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                categoryElemen!.imageUrl!, scale: 1.0
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff37475A).withOpacity(0.2),
                              blurRadius: 20.0,
                              offset: const Offset(0, 10),
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ),
    //         categoryElemen!.children!.isEmpty?
    // Obx(() {
    // if (subCategoryController.isLoading.value)
    // return Center(child: CircularProgressIndicator());
    // else {
    //         return
    //           GridView.builder(
    //           shrinkWrap: true,
    //           itemCount: subCategoryController.categoryproductList.length,
    //           physics: const BouncingScrollPhysics(),
    //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //
    //             crossAxisCount: 3,
    //             mainAxisSpacing: 10.0,
    //             crossAxisSpacing: 10.0,
    //             childAspectRatio: 0.8,
    //           ),
    //           itemBuilder: (context, index) {
    //
    //             if(index == subCategoryController.categoryproductList.length-1&&
    //                 subCategoryController.isMoreDataAvilable.value==true){
    //               subCategoryController.paginateTask();
    //               print("bnnnnnnnnnnnnn");
    //               return Center(child: CircularProgressIndicator());}
    //         ProductData productCard = subCategoryController.categoryproductList[index] ;
    //
    //             return ProductCard(
    //             product: productCard,
    //               // onSelected: (model) {
    //               //   setState(() {
    //               //     AppData.productList.forEach((item) {
    //               //       item.isSelected = false;
    //               //     });
    //               //     model.isSelected = true;
    //               //   });
    //               // },
    //             );
    //           },
    //         );}})
    //         :
            GridView.builder(
              shrinkWrap: true,
              itemCount: categoryElemen!.children!.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                CategoryElement subCategory = categoryElemen!.children![index];

                return CategoryCard(
                  categoryElement: subCategory,
                  // onSelected: (model) {
                  //   setState(() {
                  //     AppData.productList.forEach((item) {
                  //       item.isSelected = false;
                  //     });
                  //     model.isSelected = true;
                  //   });
                  // },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
