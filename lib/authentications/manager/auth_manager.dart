import 'dart:convert';
import 'package:cheff_restaurant/misc/navigation_service.dart';
import 'package:cheff_restaurant/network_calls/base_network.dart';
import 'package:cheff_restaurant/network_calls/base_response.dart';
import 'package:cheff_restaurant/splash_screen.dart';
import 'package:cheff_restaurant/utils/storage_keys.dart';
import 'package:cheff_restaurant/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';






class AuthManager {
  factory AuthManager() {
    return _singleton;
  }

  AuthManager._internal();

  static final AuthManager _singleton = AuthManager._internal();


  Future<ResponseData> performLogin(String? phone,) async {
    final formData = FormData.fromMap({
      // "phone_number": phone,
      "phone_number":phone,
      // "password":password,
      // "is_customer": true
    });

    Response response;
    try {
      response = await dioClient.tokenRef!
          .post<dynamic>(URLS.login, data: formData);

      if(response.statusCode == 200) {

        print("data of response is --${response.data}");

        return ResponseData(response.data.toString(), ResponseStatus.SUCCESS);
      } else {
        String? message = "Unknown error";
        if(response.data?.containsKey("message") == true){
          message = response.data['message'];
        }
        return ResponseData(message!, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      return ResponseData<dynamic>( "Something Server Problem", ResponseStatus.FAILED);
    }
  }



  Future<ResponseData> verifyOTP(String? phone, String? otp) async {
    final formData = FormData.fromMap({
      // "phone_number": phone,
      // "otp": otp,
      "phone_number":phone,
      "otp": otp,

    });
    final sharedPreferences = await SharedPreferences.getInstance();

    Response response;
    try {
      response = await dioClient.tokenRef!
          .post<dynamic>(URLS.verifyOTP, data: formData);

      print("------response before success ${response.data}");

      if(response.statusCode == 200) {

        print("------response after success ${response.data}");
        sharedPreferences.setString(StorageKeys.token, response.data["data"]['access_token'] ?? "");
        sharedPreferences.setString(StorageKeys.refreshToken, response.data["data"]['refresh_token'] ?? "");
        //sharedPreferences.setInt(StorageKeys.userId, response.data["user_id"]);



        return ResponseData(response.data.toString(), ResponseStatus.SUCCESS);
      } else {
        String? message = "Unknown error";
        if(response.data?.containsKey("message") == true){
          message = response.data['message'];
        }
        return ResponseData(message!, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      return ResponseData<dynamic>( "Something Server Problem", ResponseStatus.FAILED);
    }
  }

  Future<ResponseData> refreshToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String refresh = sharedPreferences.getString(StorageKeys.refreshToken) ?? "";
    final formData = FormData.fromMap({
      "refresh": refresh,
    });

    Response response;
    try {
      response = await dioClient.tokenRef!
          .post<dynamic>(URLS.tokenRefresh, data: formData);

      if(response.statusCode == 200) {
        sharedPreferences.setString(StorageKeys.token, response.data["access_token"]);
        return ResponseData("", ResponseStatus.SUCCESS);
      } else {
        authManager?.logout();
        String? message = "Unknown error";
        if(response.data?.containsKey("message") == true){
          message = response.data['message'];
        }
        return ResponseData(message!, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      return ResponseData<dynamic>( err.toString(), ResponseStatus.FAILED);
    }
  }


  // Future<ResponseData> fetchProfile() async {
  //   Response response;
  //   try {
  //     response = await dioClient.ref!.get<dynamic>(URLS.userProfile);
  //
  //     if (response.statusCode == 200) {
  //       print(response.data);
  //       final profile = userDataModelFromJson(jsonEncode(response.data));
  //       return ResponseData("success", ResponseStatus.SUCCESS,
  //           data: profile);
  //     } else {
  //       var message = "Unknown error";
  //       if (response.data?.containsKey("message") == true) {
  //         message = response.data['message'];
  //       }
  //       if (response.data?.containsKey("code") == true) {
  //         message = response.data['code'];
  //       }
  //       return ResponseData(message, ResponseStatus.FAILED);
  //     }
  //   } on Exception catch (err) {
  //     var msg = ParseError.parse(err);
  //     return ResponseData<dynamic>(msg, ResponseStatus.FAILED);
  //   }
  // }
  // Future<ResponseData> updateProfile() async {
  //   Response response;
  //   try {
  //     response = await dioClient.ref!.get<dynamic>(URLS.userProfile);
  //
  //     if (response.statusCode == 200) {
  //       final profile = userDataModelFromJson(jsonEncode(response.data));
  //       return ResponseData("success", ResponseStatus.SUCCESS,
  //           data: profile);
  //     } else {
  //       var message = "Unknown error";
  //       if (response.data?.containsKey("message") == true) {
  //         message = response.data['message'];
  //       }
  //       return ResponseData(message, ResponseStatus.FAILED);
  //     }
  //   } on Exception catch (err) {
  //     var msg = ParseError.parse(err);
  //     return ResponseData<dynamic>(msg, ResponseStatus.FAILED);
  //   }
  // }


  Future<void> logout() async {
    await (await SharedPreferences.getInstance()).clear();
    NavigationService().navigatePage(SplashScreen());
  }
}

AuthManager authManager = AuthManager();