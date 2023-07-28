// To parse this JSON data, do
//
//     final categoriesListModel = categoriesListModelFromJson(jsonString);

import 'dart:convert';

CategoriesListModel categoriesListModelFromJson(String str) => CategoriesListModel.fromJson(json.decode(str));

String categoriesListModelToJson(CategoriesListModel data) => json.encode(data.toJson());

class CategoriesListModel {
  List<CategoryList>? data;

  CategoriesListModel({
    this.data,
  });

  factory CategoriesListModel.fromJson(Map<String, dynamic> json) => CategoriesListModel(
    data: json["data"] == null ? [] : List<CategoryList>.from(json["data"]!.map((x) => CategoryList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CategoryList {
  int? categoryId;
  String? categoryName;

  CategoryList({
    this.categoryId,
    this.categoryName,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
  };
}
