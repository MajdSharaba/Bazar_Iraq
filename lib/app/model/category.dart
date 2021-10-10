// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.categoryElement,

  });

  List<CategoryElement>? categoryElement;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryElement: List<CategoryElement>.from(json["category"].map((x) => CategoryElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": List<dynamic>.from(categoryElement!.map((x) => x.toJson())),
  };
}

class CategoryElement {
  CategoryElement({
    this.id,
    this.nameEn,
    this.nameAr,
    this.nameKr,
    this.parentId,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.numChildren,
    this.numAds,
    this.children,
  });

  int? id;
  String? nameEn;
  String? nameAr;
  String? nameKr;
  dynamic? parentId;
  String? imageUrl;
  dynamic? createdAt;
  dynamic? updatedAt;
  int? numChildren;
  int? numAds;
  List<CategoryElement>? children;

  factory CategoryElement.fromJson(Map<String, dynamic> json) => CategoryElement(
    id: json["id"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    nameKr: json["name_kr"],
    parentId: json["parent_id"],
    imageUrl: json["image_url"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    numChildren: json["num_children"],
    numAds: json["num_ads"],
    children: List<CategoryElement>.from(json["children"].map((x) => CategoryElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "name_kr": nameKr,
    "parent_id": parentId,
    "image_url": imageUrl,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "num_children": numChildren,
    "num_ads": numAds,
    "children": List<dynamic>.from(children!.map((x) => x.toJson())),
  };
}
