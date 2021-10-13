// To parse this JSON data, do
//
//     final productDetail = productDetailFromJson(jsonString);
// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

ProductDetail productDetailFromJson(String str) => ProductDetail.fromJson(json.decode(str));

String productDetailToJson(ProductDetailData data) => json.encode(data.toJson());

class ProductDetail {
  ProductDetail({
    this.productDetailData,

  });

  ProductDetailData? productDetailData;


  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    productDetailData: ProductDetailData.fromJson(json["product"]),

  );

  Map<String, dynamic> toJson() => {
    "product": productDetailData!.toJson(),

  };
}

class ProductDetailData {
  ProductDetailData({
    this.id,
    this.price,
    this.userId,
    this.categoryId,
    this.productType,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.isFeatured,
    this.name,
    this.desc,
    this.atts,
    this.images,
    this.comments,
  });

  int? id;
  String? price;
  String? userId;
  String? categoryId;
  String? productType;
  String? storeId;
  dynamic? createdAt;
  dynamic? updatedAt;
  String? isFeatured;
  String? name;
  String? desc;
  List<Att>? atts;
  List<ImageD>? images;
  List<Comment>? comments;

  factory ProductDetailData.fromJson(Map<String, dynamic> json) => ProductDetailData(
    id: json["id"],
    price: json["price"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    productType: json["product_type"],
    storeId: json["store_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    isFeatured: json["is_featured"],
    name: json["name"],
    desc: json["desc"],
    atts: List<Att>.from(json["atts"].map((x) => Att.fromJson(x))),
    images: List<ImageD>.from(json["images"].map((x) => ImageD.fromJson(x))),
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "user_id": userId,
    "category_id": categoryId,
    "product_type": productType,
    "store_id": storeId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "is_featured": isFeatured,
    "name": name,
    "desc": desc,
    "atts": List<dynamic>.from(atts!.map((x) => x.toJson())),
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
  };
}

class Att {
  Att({
    this.name,
    this.value,
  });

  String? name;
  String? value;

  factory Att.fromJson(Map<String, dynamic> json) => Att(
    name: json["name"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
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
  String? status;
  String? userId;
  String? rating;
  String? productId;
  dynamic? createdAt;
  dynamic? updatedAt;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    comment: json["comment"],
    status: json["status"],
    userId: json["user_id"],
    rating: json["rating"],
    productId: json["product_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "comment": comment,
    "status": status,
    "user_id": userId,
    "rating": rating,
    "product_id": productId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class ImageD {
  ImageD({
    this.id,
    this.targetType,
    this.targetId,
    this.mediaType,
    this.originalUrl,
    this.thumbUrl,
    this.orderSn,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? targetType;
  String? targetId;
  String? mediaType;
  String? originalUrl;
  String? thumbUrl;
  String? orderSn;
  dynamic? createdAt;
  dynamic? updatedAt;

  factory ImageD.fromJson(Map<String, dynamic> json) => ImageD(
    id: json["id"],
    targetType: json["target_type"],
    targetId: json["target_id"],
    mediaType: json["media_type"],
    originalUrl: json["original_url"],
    thumbUrl: json["thumb_url"],
    orderSn: json["order_sn"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "target_type": targetType,
    "target_id": targetId,
    "media_type": mediaType,
    "original_url": originalUrl,
    "thumb_url": thumbUrl,
    "order_sn": orderSn,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

/////////////////
// import 'dart:convert';,l,l,
//
// ProductDetail productDetailFromJson(String str) => ProductDetail.fromJson(json.decode(str));
//
// String productDetailToJson(ProductDetail data) => json.encode(data.toJson());
//
// class ProductDetail {
//   ProductDetail({
//     this.productDetailData,
//
//   });
//
//   ProductDetailData? productDetailData;
//
//
//   factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
//     productDetailData: ProductDetailData.fromJson(json["product"]),
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "product": productDetailData!.toJson(),
//
//   };
// }
//
// class ProductDetailData {
//   ProductDetailData({
//     this.id,
//     this.name,
//
//     this.price,
//     this.userId,
//     this.categoryId,
//     this.productType,
//     this.storeId,
//     this.createdAt,
//     this.updatedAt,
//     this.isFeatured,
//     this.attributes,
//     this.images,
//     this.comments,
//     this.des,
//
//   });
//
//   int? id;
//   String? name;
//
//   String? price;
//   String? userId;
//   String? categoryId;
//   String? productType;
//   String? storeId;
//   dynamic? createdAt;
//   dynamic? updatedAt;
//   String? isFeatured;
//   String? des;
//
//   List<Attribute>? attributes;
//   List<ImageD>? images;
//   List<Comment>? comments;
//
//   factory ProductDetailData.fromJson(Map<String, dynamic> json) => ProductDetailData(
//     id: json["id"],
//     name: json["name"],
//
//     des : json["desc"],
//
//     price: json["price"],
//     userId: json["user_id"],
//     categoryId: json["category_id"],
//     productType: json["product_type"],
//     storeId: json["store_id"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//     isFeatured: json["is_featured"],
//     attributes: List<Attribute>.from(json["atts"].map((x) => Attribute.fromJson(x))),
//     images: List<ImageD>.from(json["images"].map((x) => ImageD.fromJson(x))),
//     comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//
//     "price": price,
//     "user_id": userId,
//     "category_id": categoryId,
//     "product_type": productType,
//     "store_id": storeId,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//     "is_featured": isFeatured,
//     "attributes": List<dynamic>.from(attributes!.map((x) => x.toJson())),
//     "images": List<dynamic>.from(images!.map((x) => x.toJson())),
//     "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
//   };
// }
//
// class Attribute {
//   Attribute({
//     this.name,
//     this.value,
//
//   });
//
//   String? name;
//
//   String? value;
//
//   factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
//     name: json["name"],
//
//     value: json["value"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//
//     "value": value,
//
//   };
// }
//
// class AttributeOption {
//   AttributeOption({
//     this.id,
//     this.attributeId,
//     this.valueEn,
//     this.valueAr,
//     this.valueKr,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int? id;
//   String? attributeId;
//   String? valueEn;
//   String? valueAr;
//   String? valueKr;
//   dynamic? createdAt;
//   dynamic? updatedAt;
//
//   factory AttributeOption.fromJson(Map<String, dynamic> json) => AttributeOption(
//     id: json["id"],
//     attributeId: json["attribute_id"],
//     valueEn: json["value_en"],
//     valueAr: json["value_ar"],
//     valueKr: json["value_kr"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "attribute_id": attributeId,
//     "value_en": valueEn,
//     "value_ar": valueAr,
//     "value_kr": valueKr,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }
//
// class Pivot {
//   Pivot({
//     this.productId,
//     this.attributeId,
//     this.attributeValue,
//   });
//
//   String? productId;
//   String? attributeId;
//   String? attributeValue;
//
//   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//     productId: json["product_id"],
//     attributeId: json["attribute_id"],
//     attributeValue: json["attribute_value"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "product_id": productId,
//     "attribute_id": attributeId,
//     "attribute_value": attributeValue,
//   };
// }
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
//   String? status;
//   String? userId;
//   String? rating;
//   String? productId;
//   dynamic? createdAt;
//   dynamic? updatedAt;
//
//   factory Comment.fromJson(Map<String, dynamic> json) => Comment(
//     id: json["id"],
//     comment: json["comment"],
//     status: json["status"],
//     userId: json["user_id"],
//     rating: json["rating"],
//     productId: json["product_id"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "comment": comment,
//     "status": status,
//     "user_id": userId,
//     "rating": rating,
//     "product_id": productId,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }
//
// class ImageD {
//   ImageD({
//     this.id,
//     this.targetType,
//     this.targetId,
//     this.mediaType,
//     this.originalUrl,
//     this.thumbUrl,
//     this.orderSn,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int? id;
//   String? targetType;
//   String? targetId;
//   String? mediaType;
//   String? originalUrl;
//   String? thumbUrl;
//   String? orderSn;
//   dynamic? createdAt;
//   dynamic? updatedAt;
//
//   factory ImageD.fromJson(Map<String, dynamic> json) => ImageD(
//     id: json["id"],
//     targetType: json["target_type"],
//     targetId: json["target_id"],
//     mediaType: json["media_type"],
//     originalUrl: json["original_url"],
//     thumbUrl: json["thumb_url"],
//     orderSn: json["order_sn"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "target_type": targetType,
//     "target_id": targetId,
//     "media_type": mediaType,
//     "original_url": originalUrl,
//     "thumb_url": thumbUrl,
//     "order_sn": orderSn,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }

// To parse this JSON data, do
//
//     final productDetail = productDetailFromJson(jsonString);
// To parse this JSON data, do
//
//     final productDetail = productDetailFromJson(jsonString);

// import 'dart:convert';
//
// ProductDetail productDetailFromJson(String str) => ProductDetail.fromJson(json.decode(str));
//
// String productDetailToJson(ProductDetail data) => json.encode(data.toJson());
//
// class ProductDetail {
//   ProductDetail({
//     this.productDetailData,
//
//   });
//
//   ProductDetailData? productDetailData;
//
//
//   factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
//     productDetailData: ProductDetailData.fromJson(json["product"]),
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "product": productDetailData!.toJson(),
//
//   };
// }
//
// class ProductDetailData {
//   ProductDetailData({
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
//     this.attributes,
//     this.images,
//     this.comments,
//   });
//
//   int? id;
//   String? nameEn;
//   String? nameAr;
//   String? nameKr;
//   String? price;
//   String? userId;
//   String? categoryId;
//   String? productType;
//   String? storeId;
//   dynamic? createdAt;
//   dynamic? updatedAt;
//   String? isFeatured;
//   List<dynamic>? attributes;
//   List<Image>? images;
//   List<Comment>? comments;
//
//   factory ProductDetailData.fromJson(Map<String, dynamic> json) => ProductDetailData(
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
//     attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
//     images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//     comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
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
//     "attributes": List<dynamic>.from(attributes!.map((x) => x)),
//     "images": List<dynamic>.from(images!.map((x) => x.toJson())),
//     "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
//   };
// }
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
//   String? status;
//   String? userId;
//   String? rating;
//   String? productId;
//   dynamic? createdAt;
//   dynamic? updatedAt;
//
//   factory Comment.fromJson(Map<String, dynamic> json) => Comment(
//     id: json["id"],
//     comment: json["comment"],
//     status: json["status"],
//     userId: json["user_id"],
//     rating: json["rating"],
//     productId: json["product_id"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "comment": comment,
//     "status": status,
//     "user_id": userId,
//     "rating": rating,
//     "product_id": productId,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }
//
// class Image {
//   Image({
//     this.id,
//     this.targetType,
//     this.targetId,
//     this.mediaType,
//     this.originalUrl,
//     this.thumbUrl,
//     this.orderSn,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int ?id;
//   String? targetType;
//   String? targetId;
//   String? mediaType;
//   String? originalUrl;
//   String? thumbUrl;
//   String? orderSn;
//   dynamic? createdAt;
//   dynamic? updatedAt;
//
//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//     id: json["id"],
//     targetType: json["target_type"],
//     targetId: json["target_id"],
//     mediaType: json["media_type"],
//     originalUrl: json["original_url"],
//     thumbUrl: json["thumb_url"],
//     orderSn: json["order_sn"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "target_type": targetType,
//     "target_id": targetId,
//     "media_type": mediaType,
//     "original_url": originalUrl,
//     "thumb_url": thumbUrl,
//     "order_sn": orderSn,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }
///////////////////////////////////////////////
// import 'dart:convert';
//
// ProductDetail productDetailFromJson(String str) => ProductDetail.fromJson(json.decode(str));
//
// String productDetailToJson(ProductDetail data) => json.encode(data.toJson());
//
// class ProductDetail {
//   ProductDetail({
//     this.productDetailData,
//
//   });
//
//   ProductDetailData? productDetailData;
//
//
//   factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
//     productDetailData: ProductDetailData.fromJson(json["product"]),
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "product": productDetailData!.toJson(),
//
//   };
// }
//
// class ProductDetailData {
//   ProductDetailData({
//     this.id,
//     this.name,
//     this.price,
//     this.userId,
//     this.categoryId,
//     this.productType,
//     this.storeId,
//     this.createdAt,
//     this.updatedAt,
//     this.isFeatured,
//     this.attributes,
//     this.images,
//     this.comments,
//   });
//
//   int? id;
//   String? name;
//   int? price;
//   int? userId;
//   int? categoryId;
//   int? productType;
//   dynamic? storeId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? isFeatured;
//   List<dynamic>? attributes;
//   List<Image>? images;
//   List<Comment>? comments;
//
//   factory ProductDetailData.fromJson(Map<String, dynamic> json) => ProductDetailData(
//     id: json["id"],
//     name: json["name"],
//     price: json["price"],
//     userId: json["user_id"],
//     categoryId: json["category_id"],
//     productType: json["product_type"],
//     storeId: json["store_id"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     isFeatured: json["is_featured"],
//     attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
//     images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//     comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "price": price,
//     "user_id": userId,
//     "category_id": categoryId,
//     "product_type": productType,
//     "store_id": storeId,
//     "created_at": createdAt!.toIso8601String(),
//     "updated_at": updatedAt!.toIso8601String(),
//     "is_featured": isFeatured,
//     "attributes": List<dynamic>.from(attributes!.map((x) => x)),
//     "images": List<dynamic>.from(images!.map((x) => x.toJson())),
//     "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
//   };
// }
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
//
// class Image {
//   Image({
//     this.id,
//     this.targetType,
//     this.targetId,
//     this.mediaType,
//     this.originalUrl,
//     this.thumbUrl,
//     this.orderSn,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int? id;
//   int? targetType;
//   int? targetId;
//   String? mediaType;
//   String? originalUrl;
//   String? thumbUrl;
//   int? orderSn;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//     id: json["id"],
//     targetType: json["target_type"],
//     targetId: json["target_id"],
//     mediaType: json["media_type"],
//     originalUrl: json["original_url"],
//     thumbUrl: json["thumb_url"],
//     orderSn: json["order_sn"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "target_type": targetType,
//     "target_id": targetId,
//     "media_type": mediaType,
//     "original_url": originalUrl,
//     "thumb_url": thumbUrl,
//     "order_sn": orderSn,
//     "created_at": createdAt!.toIso8601String(),
//     "updated_at": updatedAt!.toIso8601String(),
//   };
// }
