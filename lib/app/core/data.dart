import 'package:pazar_iraq/app/model/category.dart';
import 'package:pazar_iraq/app/model/product.dart';

class AppData {
  static List<Product>? productList = [
    Product(
        id: 2,
        name: 'Nike Air Max 97',
        price: 220.00,
        isliked: false,
        image: 'assets/jacket.png',
        category: "Trending Now"),
    Product(
        id: 3,
        name: 'Nike Air Max 200',
        price: 220.00,
        isliked: false,
        image: 'assets/shoe_tilt_2.png',
        category: "Trending Now"),
    Product(
        id: 3,
        name: 'Nike Air Max 200',
        price: 220.00,
        isliked: false,
        image: 'assets/shoe_tilt_2.png',
        category: "Trending Now"),
    Product(
          id: 2,
          name: 'Nike Air Max 200',
          price: 220.00,
          isliked: false,
          image: 'assets/small_tilt_shoe_1.png',
          category: "Trending Now"),
  ];
  static List<Category> categories = [
    const Category(
      image: "assets/Kerman.png",
      name: "Kerman",
      monthyear: "Far 1399",
      oldprice: "258500",
      newprice: "150000",
      discount: "58",
    ),
    const Category(
      image: "assets/Mashhad.png",
      name: "Mashhad",
      monthyear: "Far 1399",
      oldprice: "258500",
      newprice: "150000",
      discount: "58",
    ),
    const Category(
      image: "assets/Tehran.png",
      name: "Tehran",
      monthyear: "Far 1399",
      oldprice: "258500",
      newprice: "150000",
      discount: "58",
    ),
  ];
}