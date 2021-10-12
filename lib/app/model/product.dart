
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.productData,

  });

  List<ProductData>? productData;


  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productData: List<ProductData>.from(json["products"]["data"].map((x) => ProductData.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(productData!.map((x) => x.toJson())),

  };
}

class ProductData {
  ProductData({
    this.id,
    this.nameEn,
    this.nameAr,
    this.nameKr,
    this.price,
    this.userId,
    this.categoryId,
    this.productType,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.isFeatured,
    this.images,
    this.desAr,
    this.desEn,
    this.desKr,
  });

  int? id;
  String? nameEn;
  String? nameAr;
  String? nameKr;
  String? price;
  String? userId;
  String? categoryId;
  String? productType;
  String? storeId;
  String? desEn;
  String? desAr;
  String? desKr;
  dynamic? createdAt;
  dynamic? updatedAt;
  String? isFeatured;
  List<Imagee>? images;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    id: json["id"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    nameKr: json["name_kr"],
    desEn : json["desc_en"],
    desAr : json["desc_ar"],
    desKr : json["desc_kr"],
    price: json["price"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    productType: json["product_type"],
    storeId: json["store_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    isFeatured: json["is_featured"],
    images: List<Imagee>.from(json["images"].map((x) => Imagee.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "name_kr": nameKr,
    "price": price,
    "user_id": userId,
    "category_id": categoryId,
    "product_type": productType,
    "store_id": storeId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "is_featured": isFeatured,
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}

class Imagee {
  Imagee({
    // this.id,
    // this.targetType,
    // this.targetId,
    // this.mediaType,
    this.originalUrl,
    // this.thumbUrl,
    // this.orderSn,
    // this.createdAt,
    // this.updatedAt,
  });

  // int? id;
  // String? targetType;
  // String? targetId;
  // String? mediaType;
  String? originalUrl;
  // String? thumbUrl;
  // String? orderSn;
  // dynamic? createdAt;
  // dynamic? updatedAt;

  factory Imagee.fromJson(Map<String, dynamic> json) => Imagee(
    // id: json["id"],
    // targetType: json["target_type"],
    // targetId: json["target_id"],
    // mediaType: json["media_type"],
    originalUrl: json["original_url"],
    // thumbUrl: json["thumb_url"],
    // orderSn: json["order_sn"],
    // createdAt: json["created_at"],
    // updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    // "target_type": targetType,
    // "target_id": targetId,
    // "media_type": mediaType,
    "original_url": originalUrl,
    // "thumb_url": thumbUrl,
    // "order_sn": orderSn,
    // "created_at": createdAt,
    // "updated_at": updatedAt,
  };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}

// import 'dart:convert';
//
// Product productFromJson(String str) => Product.fromJson(json.decode(str));
//
// String productToJson(Product data) => json.encode(data.toJson());
//
// class Product {
//   Product({
//     this.productData,
//
//   });
//
//   List<ProductData>? productData;
//
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     productData: List<ProductData>.from(json["data"].map((x) => ProductData.fromJson(x))),
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": List<dynamic>.from(productData!.map((x) => x.toJson())),
//
//   };
// }
//
// class ProductData {
//   ProductData({
//     this.id,
//     this.nameEn,
//     this.nameAr,
//     this.nameKr,
//     this.price,
//     this.userId,
//     this.categoryId,
//     this.productType,
//     this.storeId,
//     this.createdAt,
//     this.updatedAt,
//     this.isFeatured,
//     this.images,
//   });
//
//
//   int? id;
//   String? nameEn;
//   String? nameAr;
//   String? nameKr;
//   String? price;
//   String? userId;
//   String? categoryId;
//   String? productType;
//   dynamic? storeId;
//   dynamic? createdAt;
//   dynamic? updatedAt;
//   String? isFeatured;
//   List<dynamic>? images;
//
//
//
//
//
//
//   factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
//     id: json["id"],
//     nameEn: json["name_en"],
//     nameAr: json["name_ar"],
//     nameKr: json["name_kr"],
//     price: json["price"],
//     userId: json["user_id"],
//     categoryId: json["category_id"],
//     productType: json["product_type"],
//     storeId: json["store_id"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//     isFeatured: json["is_featured"],
//     images: List<dynamic>.from(json["images"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name_en": nameEn,
//     "name_ar": nameAr,
//     "name_kr": nameKr,
//     "price": price,
//     "user_id": userId,
//     "category_id": categoryId,
//     "product_type": productType,
//     "store_id": storeId,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//     "is_featured": isFeatured,
//     "images": List<dynamic>.from(images!.map((x) => x)),
//   };
// }
//
//
// class Comment {
//   Comment({
//     this.id,
//     this.comment,
//     this.status,
//     this.userId,
//     this.rating,
//     this.productId,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int? id;
//   String? comment;
//   int? status;
//   int? userId;
//   int? rating;
//   int? productId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   factory Comment.fromJson(Map<String, dynamic> json) => Comment(
//     id: json["id"],
//     comment: json["comment"],
//     status: json["status"],
//     userId: json["user_id"],
//     rating: json["rating"],
//     productId: json["product_id"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "comment": comment,
//     "status": status,
//     "user_id": userId,
//     "rating": rating,
//     "product_id": productId,
//     "created_at": createdAt!.toIso8601String(),
//     "updated_at": updatedAt!.toIso8601String(),
//   };
// }
