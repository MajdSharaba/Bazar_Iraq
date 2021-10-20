
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/modules/controller/favoriteproduct_controller.dart';
import 'package:pazar_iraq/app/modules/view/widgets/favoritecard.dart';
import 'package:pazar_iraq/app/modules/view/widgets/productcard.dart';
import 'package:pazar_iraq/app/modules/view/widgets/title_text.dart';

class FavoritPage extends StatelessWidget {
  @override
  FavoriteProductController _favoriteProductController =Get.put(FavoriteProductController());
  Widget build(BuildContext context) {


    var screenSize = MediaQuery.of(context).size;
    return  Scaffold(
        body: Column(
            children: [
        ClipPath(
        clipper: WaveClipperTwo(flip: false),
      child: Container(
        height: 150,
        decoration: BoxDecoration(gradient: linearGradientColor),
        child: const Center(
            child: Text(
              "Favorite Product",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
      ),
    ), Expanded(
      child: Container(
        height: screenSize.height,
        width: double.infinity,
        child:
      Obx(() {
        if (_favoriteProductController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
        } else {
            return ListView.builder(
      itemCount: _favoriteProductController.favoriteProductList!.length  ,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.horizontal,
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (direction) {
            _favoriteProductController.deleteFromFavorite(_favoriteProductController.favoriteProductList![index].id!);
          },
          child: FavoriteCard(
            product: _favoriteProductController.favoriteProductList![index],
          ),
        );
      },
            );
        }
      })
            ),
    ),
        ]),
    );
  }
 /* FavoritPage({Key? key}) : super(key: key);
     final FavoriteProductController _favoriteProductController = Get.put(FavoriteProductController());

  @override
  Widget build(BuildContext context) {
    // var conntroller;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFCFCFC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading:const BackButton(),
        centerTitle: true,
        title:   const TitleText(
          text:"favorite",
          fontSize: 30,
        ),

      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Obx(() {
            if (_favoriteProductController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
           } else {
    return

    GridView.builder(
    shrinkWrap: true,
    itemCount: _favoriteProductController!.favoriteProductList!.length,
    physics: const BouncingScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10.0,
    crossAxisSpacing: 10.0,
    childAspectRatio: 0.8,
    ),
    itemBuilder: (context, index) {
    ProductData productData = _favoriteProductController!.favoriteProductList![index];

    return ProductCard(
    product: productData,

    );
    },
    );
    }})

        ),

    );
  }*/
}
