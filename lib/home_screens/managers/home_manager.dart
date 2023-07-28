import 'dart:convert';

import 'package:cheff_restaurant/home_screens/models/category_list_model.dart';
import 'package:cheff_restaurant/home_screens/models/category_products_list_model.dart';
import 'package:cheff_restaurant/home_screens/models/on_going_orders_list_model.dart';
import 'package:cheff_restaurant/home_screens/models/table_details_model.dart';
import 'package:cheff_restaurant/home_screens/models/tables_list_model.dart';
import 'package:cheff_restaurant/network_calls/base_network.dart';
import 'package:cheff_restaurant/network_calls/base_response.dart';
import 'package:cheff_restaurant/utils/url.dart';
import 'package:dio/dio.dart';





class HomeManager {
  factory HomeManager() {
    return _singleton;
  }

  HomeManager._internal();

  static final HomeManager _singleton = HomeManager._internal();

  Future<ResponseData> tablesListData() async {
    Response response;
    try {
      response = await dioClient.ref!.get<dynamic>(URLS.tablesList);
      print("tables data ----> ${response.data}");

      if (response.statusCode == 200) {

        print("tables data is ----> ${response.data}");

        final category = tablesListModelFromJson(jsonEncode(response.data));

        //final products = ProductsListModel.fromJson(response.data);
        // final products = productsListModelFromJson(response.data);

        print("tables data are ----> ${response.data}");


        return ResponseData("success", ResponseStatus.SUCCESS,
            data: category);
      } else {
        var message = "Unknown error";
        if (response.data?.containsKey("message") == true) {
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      print(err);
      var msg = ParseError.parse(err);
      return ResponseData<dynamic>("Something Server Problem", ResponseStatus.FAILED);
    }
  }


  Future<ResponseData> tableDetailsData(int? tableId) async {
    Response response;
    try {

      final data = <String, dynamic>{};
      // if(query.isNotEmpty) {
      //   data['search_text'] = query;
      // }

      response = await dioClient.ref!.get<dynamic>(URLS.tableDetails(tableId!),queryParameters: data);
      print("category data ----> ${response.data}");

      if (response.statusCode == 200) {

        print("category data is ----> ${response.data}");

        final tableDetails = tableDetailsModelFromJson(jsonEncode(response.data));

        //final products = ProductsListModel.fromJson(response.data);
        // final products = productsListModelFromJson(response.data);

        print("services data are ----> ${response.data}");


        return ResponseData("success", ResponseStatus.SUCCESS,
            data: tableDetails);
      } else {
        var message = "Unknown error";
        if (response.data?.containsKey("message") == true) {
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      print(err);
      var msg = ParseError.parse(err);
      return ResponseData<dynamic>("Something Server Problem", ResponseStatus.FAILED);
    }
  }

  Future<ResponseData> categoryData() async {
    Response response;
    try {
      response = await dioClient.ref!.get<dynamic>(URLS.categoryList);
      print("category data ----> ${response.data}");

      if (response.statusCode == 200) {

        print("category data is ----> ${response.data}");

        final category = categoriesListModelFromJson(jsonEncode(response.data));

        //final products = ProductsListModel.fromJson(response.data);
        // final products = productsListModelFromJson(response.data);

        print("services data are ----> ${response.data}");


        return ResponseData("success", ResponseStatus.SUCCESS,
            data: category);
      } else {
        var message = "Unknown error";
        if (response.data?.containsKey("message") == true) {
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      print(err);
      var msg = ParseError.parse(err);
      return ResponseData<dynamic>("Something Server Problem", ResponseStatus.FAILED);
    }
  }


  // Future<ResponseData> categoryProductsData(int? categoryId,{String query = ""}) async {
  //   Response response;
  //   try {
  //
  //     final data = <String, dynamic>{};
  //     if(query.isNotEmpty) {
  //       data['search_text'] = query;
  //     }
  //
  //     response = await dioClient.ref!.get<dynamic>(URLS.categoryproductsList(categoryId!,query.toString()),queryParameters: data);
  //     print("category data ----> ${response.data}");
  //
  //     if (response.statusCode == 200) {
  //
  //       print("category data is ----> ${response.data}");
  //
  //       final categoryProducts = categoryProductsListModelFromJson(jsonEncode(response.data));
  //
  //       //final products = ProductsListModel.fromJson(response.data);
  //       // final products = productsListModelFromJson(response.data);
  //
  //       print("services data are ----> ${response.data}");
  //
  //
  //       return ResponseData("success", ResponseStatus.SUCCESS,
  //           data: categoryProducts);
  //     } else {
  //       var message = "Unknown error";
  //       if (response.data?.containsKey("message") == true) {
  //         message = response.data['message'];
  //       }
  //       return ResponseData(message, ResponseStatus.FAILED);
  //     }
  //   } on Exception catch (err) {
  //     print(err);
  //     var msg = ParseError.parse(err);
  //     return ResponseData<dynamic>("Something Server Problem", ResponseStatus.FAILED);
  //   }
  // }

  Future<ResponseData> categoryProductsData(int? categoryId,int? veg,int? nonVeg,{String query = ""}) async {
    Response response;
    try {

      final data = <String, dynamic>{};
      if(query.isNotEmpty) {
        data['search_text'] = query;
      }
      if(veg == 1) {
        data["s_veg"] = 1;
      }
      if(nonVeg == 1) {
        data["is_non_veg"] = 1;
      }

      response = await dioClient.ref!.get<dynamic>(URLS.categoryproductsList(categoryId!,query.toString(),veg,nonVeg,),queryParameters: data);
      print("category data ----> ${response.data}");

      if (response.statusCode == 200) {

        print("category data is ----> ${response.data}");

        final categoryProducts = categoryProductsListModelFromJson(jsonEncode(response.data));

        //final products = ProductsListModel.fromJson(response.data);
        // final products = productsListModelFromJson(response.data);

        print("services data are ----> ${response.data}");


        return ResponseData("success", ResponseStatus.SUCCESS,
            data: categoryProducts);
      } else {
        var message = "Unknown error";
        if (response.data?.containsKey("message") == true) {
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      print(err);
      var msg = ParseError.parse(err);
      return ResponseData<dynamic>("Something Server Problem", ResponseStatus.FAILED);
    }
  }

  Future<ResponseData> updateOrder(Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    Response response;
    print("update order data here --------->${data}");

    try {
      response = await dioClient.ref!.post<dynamic>(URLS.updateOrder,data: formData);
      print("------response user List manager ${response.data}");

      if (response.statusCode == 200) {

        // final userPlacedOrder = userPlacedOrdersModelFromJson(jsonEncode(response.data));
        return ResponseData("success", ResponseStatus.SUCCESS, data: response.data
          // data: userPlacedOrder
        );
      }
      // else if (response.statusCode! == 400) {
      //  var message = "select address and payment way";
      //
      //   return ResponseData(message, ResponseStatus.FAILED);
      // }
      else {
        var message = "please add order to cart";
        if (response.data?.containsKey("message") == true) {
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      var msg = "please add order to cart";
      return ResponseData<dynamic>(msg, ResponseStatus.FAILED);
    }
  }

  Future<ResponseData> updateFoodItem(Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    Response response;
    print("update Food Item data here --------->${data}");

    try {
      response = await dioClient.ref!.post<dynamic>(URLS.updateFoodItem,data: formData);
      print("------response user List manager ${response.data}");

      if (response.statusCode == 200) {

        // final userPlacedOrder = userPlacedOrdersModelFromJson(jsonEncode(response.data));
        return ResponseData("success", ResponseStatus.SUCCESS, data: response.data
          // data: userPlacedOrder
        );
      }
      // else if (response.statusCode! == 400) {
      //  var message = "select address and payment way";
      //
      //   return ResponseData(message, ResponseStatus.FAILED);
      // }
      else {
        var message = "please add order to cart";
        if (response.data?.containsKey("message") == true) {
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      var msg = "please add order to cart";
      return ResponseData<dynamic>(msg, ResponseStatus.FAILED);
    }
  }


  Future<ResponseData> ongoingOrdersData() async {
    Response response;
    try {
      response = await dioClient.ref!.get<dynamic>(URLS.ongoingOrders);
      print("ongoing orders data ----> ${response.data}");

      if (response.statusCode == 200) {

        print("ongoing orders data is ----> ${response.data}");

        final category = onGoingOrdersListModelFromJson(jsonEncode(response.data));

        //final products = ProductsListModel.fromJson(response.data);
        // final products = productsListModelFromJson(response.data);

        print("ongoing orders data are ----> ${response.data}");


        return ResponseData("success", ResponseStatus.SUCCESS,
            data: category);
      } else {
        var message = "Unknown error";
        if (response.data?.containsKey("message") == true) {
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      print(err);
      var msg = ParseError.parse(err);
      return ResponseData<dynamic>("Something Server Problem", ResponseStatus.FAILED);
    }
  }

  Future<ResponseData> completedOrdersData() async {
    Response response;
    try {
      response = await dioClient.ref!.get<dynamic>(URLS.completedOrders);
      print("completed orders data ----> ${response.data}");

      if (response.statusCode == 200) {

        print("completed orders data is ----> ${response.data}");

        final category = onGoingOrdersListModelFromJson(jsonEncode(response.data));

        //final products = ProductsListModel.fromJson(response.data);
        // final products = productsListModelFromJson(response.data);

        print("completed orders data are ----> ${response.data}");


        return ResponseData("success", ResponseStatus.SUCCESS,
            data: category);
      } else {
        var message = "Unknown error";
        if (response.data?.containsKey("message") == true) {
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      print(err);
      var msg = ParseError.parse(err);
      return ResponseData<dynamic>("Something Server Problem", ResponseStatus.FAILED);
    }
  }



}

HomeManager homeManager = HomeManager();
