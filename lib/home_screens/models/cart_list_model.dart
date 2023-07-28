// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

CartListModel cartListModelFromJson(String str) => CartListModel.fromJson(json.decode(str));

String cartListModelToJson(CartListModel data) => json.encode(data.toJson());

class CartListModel {
  List<CartItemModel>? data;

  CartListModel({
    this.data,
  });

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
    data: json["data"] == null ? [] : List<CartItemModel>.from(json["data"]!.map((x) => CartItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CartItemModel {
  int? cartId;
  int? userId;
  int foodItemId;
  String? foodName;
  String? description;
  double? price;
  int? foodServingQuantity;
  String? image;
  int? orderedQuantity;

  CartItemModel({
    this.cartId,
    this.userId,
    required this.foodItemId,
    this.foodName,
    this.description,
    this.price,
    this.foodServingQuantity,
    this.image,
    this.orderedQuantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    cartId: json["cart_id"],
    userId: json["user_id"],
    foodItemId: json["food_item_id"],
    foodName: json["food_name"],
    description: json["description"],
    price: json["price"],
    foodServingQuantity: json["food_serving_quantity"],
    image: json["image"],
    orderedQuantity: json["ordered_quantity"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "user_id": userId,
    "food_item_id": foodItemId,
    "food_name": foodName,
    "description": description,
    "price": price,
    "food_serving_quantity": foodServingQuantity,
    "image": image,
    "ordered_quantity": orderedQuantity,
  };
}
