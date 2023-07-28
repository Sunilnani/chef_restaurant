// To parse this JSON data, do
//
//     final onGoingOrdersListModel = onGoingOrdersListModelFromJson(jsonString);

import 'dart:convert';

OnGoingOrdersListModel onGoingOrdersListModelFromJson(String str) => OnGoingOrdersListModel.fromJson(json.decode(str));

String onGoingOrdersListModelToJson(OnGoingOrdersListModel data) => json.encode(data.toJson());

class OnGoingOrdersListModel {
  List<Datum>? data;
  int? page;
  int? limit;
  int? count;

  OnGoingOrdersListModel({
    this.data,
    this.page,
    this.limit,
    this.count,
  });

  factory OnGoingOrdersListModel.fromJson(Map<String, dynamic> json) => OnGoingOrdersListModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    page: json["page"],
    limit: json["limit"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "page": page,
    "limit": limit,
    "count": count,
  };
}

class Datum {
  int? orderId;
  int? userId;
  String? userName;
  int? tableId;
  String? tableName;
  List<FoodItemsList>? foodItemsList;
  int? totalAmount;
  int? status;
  String? additionalRequest;
  DateTime createdAt;
  DateTime? updatedAt;

  Datum({
    this.orderId,
    this.userId,
    this.userName,
    this.tableId,
    this.tableName,
    this.foodItemsList,
    this.totalAmount,
    this.status,
    this.additionalRequest,
    required this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    orderId: json["order_id"],
    userId: json["user_id"],
    userName: json["user_name"],
    tableId: json["table_id"],
    tableName: json["table_name"],
    foodItemsList: json["food_items_list"] == null ? [] : List<FoodItemsList>.from(json["food_items_list"]!.map((x) => FoodItemsList.fromJson(x))),
    totalAmount: json["total_amount"],
    status: json["status"],
    additionalRequest: json["additional_request"],
    createdAt:  DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "user_id": userId,
    "user_name": userName,
    "table_id": tableId,
    "table_name": tableName,
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
  double? price;
  int? quantity;
  String? image;

  FoodItemsList({
    this.foodItemId,
    this.foodItemName,
    this.price,
    this.quantity,
    this.image,
  });

  factory FoodItemsList.fromJson(Map<String, dynamic> json) => FoodItemsList(
    foodItemId: json["food_item_id"],
    foodItemName: json["food_item_name"],
    price: json["price"],
    quantity: json["quantity"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "food_item_id": foodItemId,
    "food_item_name": foodItemName,
    "price": price,
    "quantity": quantity,
    "image": image,
  };
}
