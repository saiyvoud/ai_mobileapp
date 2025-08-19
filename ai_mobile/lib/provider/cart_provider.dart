import 'dart:io';

import 'package:ai_mobile/api/authApi.dart';
import 'package:ai_mobile/api/bannerApi.dart';
import 'package:ai_mobile/api/productApi.dart';
import 'package:ai_mobile/components/hive_database.dart';

import 'package:ai_mobile/components/messageHepler.dart';
import 'package:ai_mobile/router/router.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';

class CartProvider extends ChangeNotifier {
  bool _loading = false;
  List<dynamic> _carts = [];
  int _totalPrice = 0;
  // ຕົວປ່ຽນທີ່ເອີ້ນອອກໄປໃສ່ຫນ້າອື່ນໄດ້
  bool get loading => _loading;
  List<dynamic> get carts => _carts;
  int get totalPrice => _totalPrice;

  Future<void> saveCart({required dynamic cart, required int index}) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await HiveDatabase.saveCart(cart: cart, index: index);
      if (result == true) {
        _loading = false;
        MessageHelper.showMessage(true, "Add Cart Success");
        getCart();
        notifyListeners();
      } else {
        MessageHelper.showMessage(false, "Falid Cart Success");
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      MessageHelper.showMessage(true, e.toString());
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> removeCart({required dynamic cart,required int index}) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await HiveDatabase.removeCart(cart: cart,index:index);
      if (result == true) {
        _loading = false;
        MessageHelper.showMessage(true, "Remove  Success");
        getCart();
        notifyListeners();
      } else {
        MessageHelper.showMessage(true, "Falid");
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      MessageHelper.showMessage(true, e.toString());
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> deleteCart() async {
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final result = await HiveDatabase.deleteCartsAll();
      if (result == true) {
        _loading = false;
        getCart();
        MessageHelper.showMessage(true, "Delete Cart Success");
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "Not Found");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, "Error delete cart");
      notifyListeners();
    }
  }

  Future<void> sumTotalPrice() async {
    _loading = true;
    notifyListeners();
    try {
      int total = 0;
      final result = await HiveDatabase.getCarts();
      if (result != null) {
        for (var i = 0; i < result.length; i++) {
          total +=
              int.parse(result[i]['price'].toString()) *
              int.parse(result[i]['qty'].toString());
        }
        _totalPrice = total;
        _loading = false;
        notifyListeners();
      } else {
        _loading = false;
        _totalPrice = 0;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      _totalPrice = 0;
      notifyListeners();
    }
  }

  Future<void> getCart() async {
    _loading = true;
    notifyListeners();
    try {
      final result = await HiveDatabase.getCarts();
     
      if (result != null) {
         await sumTotalPrice();
        _loading = false;
        _carts = result;
        MessageHelper.showMessage(true, "Get Cart Success");
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "Not Found");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, "Error get cart");
      notifyListeners();
    }
  }
}
