import 'package:get/get.dart';
import 'package:pazar_iraq/app/modules/view/pages/homepage.dart';
import 'package:pazar_iraq/app/modules/view/pages/signinpage.dart';
import 'package:pazar_iraq/app/modules/view/pages/subcategorypage.dart';
import 'package:pazar_iraq/app/modules/view/pages/welcomepage.dart';


class AppRoutes {
  static const welcomePage = Routes.welcomePage;
  static const home = Routes.home;
  static const productDetails = Routes.productDetails;
  static const signIn = Routes.signInPage;
  static const subCategory = Routes.subCategory;

  static final routes = [
    GetPage(name: Routes.welcomePage , page: () => const WelcomePage()),
    GetPage(name: Routes.home , page: () => const HomePage()),
    // GetPage(name: Routes.productDetails , page: () => ProductDetailPage()),
    GetPage(name: Routes.signInPage, page: () => const SigninPage()),
    GetPage(name: Routes.subCategory, page: () =>   SubCategoryPage()),
  ];

}
class Routes {
  static const welcomePage = '/welcome_page';
  static const home = '/home';
  static const productDetails = '/product_details';
  static const signInPage = '/sign_in_page';
  static const subCategory = '/sub_category';
}