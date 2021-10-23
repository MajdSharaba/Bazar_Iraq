import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/core/languages/locale_keys.g.dart';
import 'package:pazar_iraq/app/modules/controller/auth_controller.dart';
import 'package:pazar_iraq/app/modules/controller/categories_controller.dart';
import 'package:pazar_iraq/app/modules/controller/create_product_controller.dart';
import 'package:pazar_iraq/app/modules/controller/favoriteproduct_controller.dart';
import 'package:pazar_iraq/app/modules/view/pages/chatpage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pazar_iraq/app/modules/view/pages/create_product_page_v2.dart';
import 'package:pazar_iraq/app/modules/view/pages/home_screen.dart';
import 'package:pazar_iraq/app/modules/view/pages/profile_screen.dart';
import 'package:pazar_iraq/app/modules/view/pages/signinpage.dart';

import 'favoritepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoryController categoryController = Get.put(CategoryController());
  final CreateProductController createProductController =
      Get.put(CreateProductController());
  final AuthController authController = Get.find();
  final FavoriteProductController _favoriteProductController =
      Get.put(FavoriteProductController());

  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    final _pageOptions = [
      HomeScreen(),
      authController.user.value.accessToken == null
      ?SigninPage():FavoritPage(),
      authController.user.value.accessToken == null
          ? SigninPage()
          : CreateProductPageV2(
              subCategoryList: const [],
            ),
      authController.user.value.accessToken == null
          ? SigninPage()
          : ChatPage(),
      authController.user.value.accessToken == null
          ? const SigninPage()
          : ProfileScreen()
    ];
    return Scaffold(
        body: _pageOptions[selectedPage],
        bottomNavigationBar: ConvexAppBar(
            color: Colors.white,
            backgroundColor: Colors.grey,
            gradient: linearGradientColor,
            items:  [
              TabItem(icon: Icons.home, title: LocaleKeys.home.translations()),
              TabItem(icon: Icons.map, title: 'Discovery'),
              TabItem(icon: Icons.add, title: LocaleKeys.add.translations()),
              TabItem(icon: Icons.message, title: 'Message'),
              TabItem(
                icon: Icons.people,
                title: 'Profile',
              ),
            ],
            initialActiveIndex: 2,
            //optional, default as 0
            onTap: (int i) {
              setState(() {
                selectedPage = i;
              });
            }));
  }
}
