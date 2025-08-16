import 'dart:io';

import 'package:ai_mobile/api/authApi.dart';
import 'package:ai_mobile/api/bannerApi.dart';
import 'package:ai_mobile/api/productApi.dart';

import 'package:ai_mobile/components/messageHepler.dart';
import 'package:ai_mobile/router/router.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';

class ProductProvider extends ChangeNotifier {
  bool _loading = false;
  List<dynamic> _products = [];
  // ຕົວປ່ຽນທີ່ເອີ້ນອອກໄປໃສ່ຫນ້າອື່ນໄດ້
  bool get loading => _loading;
  List<dynamic> get products => _products;

  Future<void> getProduct() async {
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final result = await ProductApi.getProduct();
      if (result != null) {
        _loading = false;
        _products = result;
        MessageHelper.showMessage(true, "Get Product Success");
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "Not Found");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, "Error get Product");
      notifyListeners();
    }
  }
  Future<void> getProductBy({
    required String categoryId
  }) async {
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final result = await ProductApi.getProductBy(categoryId: categoryId );
      if (result != null) {
        _loading = false;
        _products = result;
        MessageHelper.showMessage(true, "Get Product Success");
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "Not Found");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, "Error get Product");
      notifyListeners();
    }
  }
}
