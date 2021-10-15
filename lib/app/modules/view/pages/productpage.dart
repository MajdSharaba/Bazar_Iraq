
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/product_provider.dart';
import 'package:pazar_iraq/app/model/category.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/modules/controller/product_controller.dart';
import 'package:pazar_iraq/app/modules/controller/productpage_controller.dart';
import 'package:pazar_iraq/app/modules/view/widgets/categorycard.dart';
import 'package:pazar_iraq/app/modules/view/widgets/productcard.dart';
import 'package:pazar_iraq/app/modules/view/widgets/title_text.dart';


class ProductPage extends StatelessWidget {

  final CategoryElement? categoryElemen;

  ProductPage({Key? key, this.categoryElemen}) : super(key: key);
  final ProductPageController productpageController = Get.put(ProductPageController(categoryId:12.obs));






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
        child: PagedGridView<int, ProductData>(
            shrinkWrap: true,
            showNewPageProgressIndicatorAsGridChild: false,
            showNewPageErrorIndicatorAsGridChild: false,
            showNoMoreItemsIndicatorAsGridChild: false,
            pagingController: productpageController.pagingController,

            ///itemCount: productPageController.categoryproductList.length,
           //// physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

              childAspectRatio: 100 / 150,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
            ),

            // itemBuilder: (context, index) {
            //
            //   if(index == productPageController.categoryproductList.length-1&&
            //       productPageController.isMoreDataAvilable.value==true){
            //     productPageController.paginateTask();
            //     print("bnnnnnnnnnnnnn");
            //     return Center(child: CircularProgressIndicator());}
            builderDelegate: PagedChildBuilderDelegate<ProductData>(
                itemBuilder: (context, item, index) =>
                ///ProductData productCard = productPageController.categoryproductList[index] ;
                // Text(item.name!)
               ProductCard(
                product: item,
                // onSelected: (model) {
                //   setState(() {
                //     AppData.productList.forEach((item) {
                //       item.isSelected = false;
                //     });
                //     model.isSelected = true;
                //   });
                // },
              ))
    )));
              }}
