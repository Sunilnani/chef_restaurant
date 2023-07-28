

import 'dart:convert';

import 'package:cheff_restaurant/home_screens/models/cart_list_model.dart';
import 'package:cheff_restaurant/home_screens/models/tables_list_model.dart';
import 'package:cheff_restaurant/network_calls/base_network.dart';
import 'package:cheff_restaurant/network_calls/base_response.dart';
import 'package:cheff_restaurant/utils/url.dart';
import 'package:dio/dio.dart';



class CartManager {
  factory CartManager() {
    return _singleton;
  }

  CartManager._internal();

  static final CartManager _singleton = CartManager._internal();


  //
  // Future<ResponseData> cartListData() async {
  //   Response response;
  //   try {
  //     response = await dioClient.ref!.get<dynamic>(URLS.cartList);
  //     print("cart data ----> ${response.data}");
  //
  //     if (response.statusCode == 200) {
  //
  //       print("cart data is ----> ${response.data}");
  //
  //       final category = cartListModelFromJson(jsonEncode(response.data));
  //
  //       //final products = ProductsListModel.fromJson(response.data);
  //       // final products = productsListModelFromJson(response.data);
  //
  //       print("cart data are ----> ${response.data}");
  //
  //
  //       return ResponseData("success", ResponseStatus.SUCCESS,
  //           data: category);
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

  Future<ResponseData> cartListData() async {
    Response response;
    try {
      response = await dioClient.ref!.get<dynamic>(URLS.cartList);
      print("cart data ----> ${response.data}");

      if (response.statusCode == 200) {

        print("cart data is ----> ${response.data}");

        final category = cartListModelFromJson(jsonEncode(response.data));

        //final products = ProductsListModel.fromJson(response.data);
        // final products = productsListModelFromJson(response.data);

        print("cart data are ----> ${response.data}");


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



  Future<ResponseData> addCart(int? productId,
      //{int? clearCart}
      ) async {
    Map<String, dynamic> ?data;
    if (productId!=null){
      data = {
        "food_item_id": productId,
        "quantity":1
      };
    }

    // if(clearCart!=null) data!['hard_reset'] = 1;
    // data = {
    //   "service_vendor_id":  vendorId ?? ""// REQUEST | RETURN
    // };
    Response response;
    try {
      response = await dioClient.ref!.post<dynamic>(URLS.addCart,data: FormData.fromMap(data!));
      print("------response add cart  manager ${response.data}");

      if (response.statusCode == 200) {
        print("--======== > 1 wrg  ");



        print("check2 ${response.data}");
        return ResponseData("success", ResponseStatus.SUCCESS,
        );
      } else {
        var message = "Unknown error";
        if (response.data?.containsKey("details") == true) {
          message = response.data['details'];
        }
        return ResponseData(message, ResponseStatus.FAILED, data: response.data);
      }
    } on Exception catch (err) {
      var msg = ParseError.parse(err);
      return ResponseData<dynamic>(msg, ResponseStatus.FAILED);
    }
  }


  Future<ResponseData> updateCart(int? productId, int? quantity) async {
    // Map<String, dynamic> ?data;
    // if (cartId!=null || quantity!=null){
    //   data = {
    //     "cart_id": cartId,
    //     "quantity":quantity
    //   };
    // }
    Map<String, dynamic> ?data;
    if (productId!=null){
      data = {
        "food_item_id": productId,
        "quantity":quantity
      };
    }

    Response response;
    try {
      response = await dioClient.ref!.patch<dynamic>(URLS.updateCart,data: FormData.fromMap(data!));
      print("------response update cart  manager ${response.data}");

      if (response.statusCode == 200) {
        print("--======== > 1 wrg  ");
        // final peoducts = VendorProductsListModel.fromJson(response.data);

        print("--======== > 2 wrg  ");
        // final peoducts = vendorProductsListModelFromJson(jsonEncode(response.data));

        // Provider.of<UserNotifier>(
        //     NavigationService.navigatorKey.currentContext!,listen:false
        // ).setUser(profile);


        print("check2 ${response.data}");
        return ResponseData("success", ResponseStatus.SUCCESS,
        );
      } else {
        var message = "Unknown error";
        if (response.data?.containsKey("message") == true) {
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      var msg = ParseError.parse(err);
      return ResponseData<dynamic>(msg, ResponseStatus.FAILED);
    }
  }

  Future<ResponseData> deleteCart(int? productId) async {
    Map<String, dynamic> ?data;
    if (productId!=null){
      data = {
        "food_item_id": productId,

      };
    }
    // data = {
    //   "service_vendor_id":  vendorId ?? ""// REQUEST | RETURN
    // };
    Response response;
    try {
      response = await dioClient.ref!.delete<dynamic>(URLS.deleteCart,data: FormData.fromMap(data!));
      print("------response delete cart  manager ${response.data}");

      if (response.statusCode == 200) {
        print("--======== > 1 wrg  ");
        // final peoducts = VendorProductsListModel.fromJson(response.data);

        print("--======== > 2 wrg  ");
        // final peoducts = vendorProductsListModelFromJson(jsonEncode(response.data));

        // Provider.of<UserNotifier>(
        //     NavigationService.navigatorKey.currentContext!,listen:false
        // ).setUser(profile);


        print("check2 ${response.data}");
        return ResponseData("success", ResponseStatus.SUCCESS,
        );
      } else {
        var message = "Unknown error";
        if (response.data?.containsKey("message") == true) {
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      var msg = ParseError.parse(err);
      return ResponseData<dynamic>(msg, ResponseStatus.FAILED);
    }
  }


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


  // Future<ResponseData> ordersListData() async {
  //   Response response;
  //   try {
  //     response = await dioClient.ref!.get<dynamic>(URLS.ordersList);
  //     print("orders data ----> ${response.data}");
  //
  //     if (response.statusCode == 200) {
  //
  //       print("orders data is ----> ${response.data}");
  //
  //       final category = ordersListModelFromJson(jsonEncode(response.data));
  //
  //       //final products = ProductsListModel.fromJson(response.data);
  //       // final products = productsListModelFromJson(response.data);
  //
  //       print("orders data are ----> ${response.data}");
  //
  //
  //       return ResponseData("success", ResponseStatus.SUCCESS,
  //           data: category);
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
  //
  //
  // Future<ResponseData> orderDetailsData(int? orderId) async {
  //   Response response;
  //   try {
  //
  //     final data = <String, dynamic>{};
  //     // if(query.isNotEmpty) {
  //     //   data['search_text'] = query;
  //     // }
  //
  //     response = await dioClient.ref!.get<dynamic>(URLS.orderDetails(orderId!),queryParameters: data);
  //     print("category data ----> ${response.data}");
  //
  //     if (response.statusCode == 200) {
  //
  //       print("category data is ----> ${response.data}");
  //
  //       final categoryProducts = orderDetailsModelFromJson(jsonEncode(response.data));
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

  Future<ResponseData> placeOrder(
      Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    Response response;
    print("placed data here --------->${data}");

    try {
      response = await dioClient.ref!.post<dynamic>(URLS.placeOrder,data: formData);
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











}

final cartManager = CartManager();