// To parse this JSON data, do
//
//     final categoryProductsListModel = categoryProductsListModelFromJson(jsonString);

import 'dart:convert';

CategoryProductsListModel categoryProductsListModelFromJson(String str) => CategoryProductsListModel.fromJson(json.decode(str));

String categoryProductsListModelToJson(CategoryProductsListModel data) => json.encode(data.toJson());

class CategoryProductsListModel {
  int? categoryId;
  String? categoryName;
  List<FoodItemsList>? foodItemsList;

  CategoryProductsListModel({
    this.categoryId,
    this.categoryName,
    this.foodItemsList,
  });

  factory CategoryProductsListModel.fromJson(Map<String, dynamic> json) => CategoryProductsListModel(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    foodItemsList: json["food_items_list"] == null ? [] : List<FoodItemsList>.from(json["food_items_list"]!.map((x) => FoodItemsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "food_items_list": foodItemsList == null ? [] : List<dynamic>.from(foodItemsList!.map((x) => x.toJson())),
  };
}

class FoodItemsList {
  int foodItemId;
  String? name;
  String? description;
  double? price;
  int? servingQuantity;
  String? image;
  bool? isAvailable;

  FoodItemsList({
    required this.foodItemId,
    this.name,
    this.description,
    this.price,
    this.servingQuantity,
    this.image,
    this.isAvailable,
  });

  factory FoodItemsList.fromJson(Map<String, dynamic> json) => FoodItemsList(
    foodItemId: json["food_item_id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    servingQuantity: json["serving_quantity"],
    image: json["image"],
    isAvailable: json["is_available"],
  );

  Map<String, dynamic> toJson() => {
    "food_item_id": foodItemId,
    "name": name,
    "description": description,
    "price": price,
    "serving_quantity": servingQuantity,
    "image": image,
    "is_available": isAvailable,
  };
}
