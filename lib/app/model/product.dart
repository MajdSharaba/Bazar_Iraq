

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.productData,

  });

  List<ProductData>? productData;


  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productData: List<ProductData>.from(json["data"].map((x) => ProductData.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(productData!.map((x) => x.toJson())),

  };
}

class ProductData {
  ProductData({
    this.id,
    this.name,
    this.price,
    this.userId,
    this.categoryId,
    this.productType,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.isFeatured,
    this.images,

  });


  int? id;
  String? name;
  int? price;
  int? userId;
  int? categoryId;
  int? productType;
  dynamic? storeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isFeatured;
  List<dynamic>? images;
  List<Comment>? comments;
  List<dynamic>? attributes;


  setcomments(var comments){
    this.comments = comments;

  }



  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    productType: json["product_type"],
    storeId: json["store_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isFeatured: json["is_featured"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "user_id": userId,
    "category_id": categoryId,
    "product_type": productType,
    "store_id": storeId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "is_featured": isFeatured,
    "images": List<dynamic>.from(images!.map((x) => x)),
  };
}


class Comment {
  Comment({
    this.id,
    this.comment,
    this.status,
    this.userId,
    this.rating,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? comment;
  int? status;
  int? userId;
  int? rating;
  int? productId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    comment: json["comment"],
    status: json["status"],
    userId: json["user_id"],
    rating: json["rating"],
    productId: json["product_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "comment": comment,
    "status": status,
    "user_id": userId,
    "rating": rating,
    "product_id": productId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
