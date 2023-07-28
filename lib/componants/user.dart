import 'package:flutter/material.dart';

class UserInfo extends ChangeNotifier{
  bool _isLoggedIn = false;
  int _serviceType = 0;
  int _cart =0;

  int _productItems =0;

  double _totalAmount =0;
  double _couponAmount=0;
  int _deliveryPartnerTip =0;
  String _fullName = '';

  String get fullName => _fullName;
  set fullName(String value){
    _fullName = value;
    notifyListeners();
  }

  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool value){
    _isLoggedIn = value;
    notifyListeners();
  }

  double get totalAmount => _totalAmount;
  set totalAmount(double value){
    _totalAmount = value;
    notifyListeners();
  }

  int get deliveryPartnerTip => _deliveryPartnerTip;
  set deliveryPartnerTip(int value){
    _deliveryPartnerTip = value;
    notifyListeners();
  }

  double get couponAmount => _couponAmount;
  set couponAmount(double value){
    _couponAmount = value;
    notifyListeners();
  }

  int get productItems => _productItems;
  set productItems(int value){
    _productItems = value;
    notifyListeners();
  }

  int get serviceType => _serviceType;
  set serviceType(int value){
    _serviceType = value;
    notifyListeners();
  }



  int get cart => _cart;
  set cart(int value){
    _cart = value;
    notifyListeners();
  }


}
final userInfo = UserInfo();