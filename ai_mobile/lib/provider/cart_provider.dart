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
  // ຕົວປ່ຽນທີ່ເອີ້ນອອກໄປໃສ່ຫນ້າອື່ນໄດ້
  bool get loading => _loading;
  List<dynamic> get carts => _carts;

  Future<void> saveCart({required dynamic cart, required int index}) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await HiveDatabase.saveCart(cart: cart,index: index);
      if (result == true) {
        _loading = false;
        MessageHelper.showMessage(true, "Add Cart Success");
        notifyListeners();
      } else {
        MessageHelper.showMessage(true, "Falid Cart Success");
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      MessageHelper.showMessage(true, e.toString());
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> getCart() async {
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final result = await HiveDatabase.getCarts();
      if (result != null) {
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
