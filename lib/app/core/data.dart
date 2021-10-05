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
      image: "http://www.newdesignfile.com/postpic/2013/07/car-icon_76093.png",
      name: "Cars",
      monthyear: "Far 1399",
      oldprice: "258500",
      newprice: "150000",
      discount: "58",
    ),
    const Category(
      image: "https://www.freeiconspng.com/uploads/cruiser-motorcycle-blue-icon-22.png",
      name: "Motorcycles",
      monthyear: "Far 1399",
      oldprice: "258500",
      newprice: "150000",
      discount: "58",
    ),
    const Category(
      image: "https://th.bing.com/th/id/R.d808211ff9221398f5e10628887ecb72?rik=8Zew0ThlvhCy9g&pid=ImgRaw&r=0",
      name: "Spare parts",
      monthyear: "Far 1399",
      oldprice: "258500",
      newprice: "150000",
      discount: "58",
    ),
  ];
  static List<Category> categories2 = [
    const Category(
      image: "https://th.bing.com/th?id=OIF.RvXPLpTPAlWHmUk%2flyUFPA&pid=ImgDet&rs=1",
      name: "Air Conditioner",
      monthyear: "Far 1399",
      oldprice: "258500",
      newprice: "150000",
      discount: "58",
    ),
    const Category(
      image: "https://media.istockphoto.com/vectors/cleaning-icon-vector-id859176996?k=6&m=859176996&s=612x612&w=0&h=kgfO4fwohrzlRya4VckzdHEkhChYVv52y8MPK4KIJoY=",
      name: "Cleanning services",
      monthyear: "Far 1399",
      oldprice: "258500",
      newprice: "150000",
      discount: "58",
    ),
    const Category(
      image: "https://th.bing.com/th/id/OIP.sazFCXu-q4syPm9t5YJefwHaHa?pid=ImgDet&rs=1",
      name: "Education",
      monthyear: "Far 1399",
      oldprice: "258500",
      newprice: "150000",
      discount: "58",
    ),
  ];
  static List<Category> subCategure = [
    const Category(
      image: "https://th.bing.com/th/id/R.53bd70cc9e140e578daf124785d754e9?rik=5YQKdBPO%2fnDxfA&pid=ImgRaw&r=0",
      name: "Nissan",
      monthyear: "Far 1399",
      oldprice: "258500",
      newprice: "150000",
      discount: "58",
    ),
    const Category(
      image: "https://img-new.cgtrader.com/items/61583/bmw_logo_3d_model_max__a4c7f966-684e-4978-9824-e3110d9bdfb8.jpg",
      name: "Bmw",
      monthyear: "Far 1399",
      oldprice: "258500",
      newprice: "150000",
      discount: "58",
    ),
    const Category(
      image: "https://th.bing.com/th/id/OIP.m2Q1HW9MaQSS7Pd5cF6FxQHaFj?pid=ImgDet&rs=1",
      name: "Mercedes",
      monthyear: "Far 1399",
      oldprice: "258500",
      newprice: "150000",
      discount: "58",
    ),
    const Category(
      image: "https://www.pngitem.com/pimgs/m/141-1416543_kia-motors-logo-png-image-transparent-png.png",
      name: "Kia",
      monthyear: "Far 1399",
      oldprice: "258500",
      newprice: "150000",
      discount: "58",
    ),
  ];
}