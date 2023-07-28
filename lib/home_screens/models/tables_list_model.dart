// To parse this JSON data, do
//
//     final tablesListModel = tablesListModelFromJson(jsonString);

import 'dart:convert';

List<TablesListModel> tablesListModelFromJson(String str) => List<TablesListModel>.from(json.decode(str).map((x) => TablesListModel.fromJson(x)));

String tablesListModelToJson(List<TablesListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TablesListModel {
  int? id;
  String? name;
  bool? isOrdered;

  TablesListModel({
    this.id,
    this.name,
    this.isOrdered,
  });

  factory TablesListModel.fromJson(Map<String, dynamic> json) => TablesListModel(
    id: json["id"],
    name: json["name"],
    isOrdered: json["is_ordered"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_ordered": isOrdered,
  };
}
