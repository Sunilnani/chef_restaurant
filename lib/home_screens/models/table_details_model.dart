// To parse this JSON data, do
//
//     final tableDetailsModel = tableDetailsModelFromJson(jsonString);

import 'dart:convert';

TableDetailsModel tableDetailsModelFromJson(String str) => TableDetailsModel.fromJson(json.decode(str));

String tableDetailsModelToJson(TableDetailsModel data) => json.encode(data.toJson());

class TableDetailsModel {
  int? orderId;
  int? userId;
  String? userName;
  int? tableId;
  String? tableName;
  bool? isOrdered;
  List<FoodItemsList>? foodItemsList;
  int? totalAmount;
  int? status;
  dynamic additionalRequest;
  DateTime? createdAt;
  DateTime? updatedAt;

  TableDetailsModel({
    this.orderId,
    this.userId,
    this.userName,
    this.tableId,
    this.tableName,
    this.isOrdered,
    this.foodItemsList,
    this.totalAmount,
    this.status,
    this.additionalRequest,
    this.createdAt,
    this.updatedAt,
  });

  factory TableDetailsModel.fromJson(Map<String, dynamic> json) => TableDetailsModel(
    orderId: json["order_id"],
    userId: json["user_id"],
    userName: json["user_name"],
    tableId: json["table_id"],
    tableName: json["table_name"],
    isOrdered: json["is_ordered"],
    foodItemsList: json["food_items_list"] == null ? [] : List<FoodItemsList>.from(json["food_items_list"]!.map((x) => FoodItemsList.fromJson(x))),
    totalAmount: json["total_amount"],
    status: json["status"],
    additionalRequest: json["additional_request"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "user_id": userId,
    "user_name": userName,
    "table_id": tableId,
    "table_name": tableName,
    "is_ordered": isOrdered,
    "food_items_list": foodItemsList == null ? [] : List<dynamic>.from(foodItemsList!.map((x) => x.toJson())),
    "total_amount": totalAmount,
    "status": status,
    "additional_request": additionalRequest,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class FoodItemsList {
  int? foodItemId;
  String? foodItemName;
  String? description;
  double? price;
  int? quantity;
  String? image;

  FoodItemsList({
    this.foodItemId,
    this.foodItemName,
    this.description,
    this.price,
    this.quantity,
    this.image,
  });

  factory FoodItemsList.fromJson(Map<String, dynamic> json) => FoodItemsList(
    foodItemId: json["food_item_id"],
    foodItemName: json["food_item_name"],
    description: json["description"],
    price: json["price"],
    quantity: json["quantity"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "food_item_id": foodItemId,
    "food_item_name": foodItemName,
    "description":description,
    "price": price,
    "quantity": quantity,
    "image": image,
  };
}
