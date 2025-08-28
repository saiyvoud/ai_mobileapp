import 'package:ai_mobile/api/orderApi.dart';
import 'package:ai_mobile/api/productApi.dart';

import 'package:ai_mobile/components/messageHepler.dart';
import 'package:ai_mobile/router/router.dart';

import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';

class OrderProvider extends ChangeNotifier {
  bool _loading = false;
  List<dynamic> _orders = [];
  // ຕົວປ່ຽນທີ່ເອີ້ນອອກໄປໃສ່ຫນ້າອື່ນໄດ້
  bool get loading => _loading;
  List<dynamic> get orders => _orders;

  Future<void> createOrder({
    required int totalPrice,
    required dynamic cart,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await OrderApi.createOrder(
        totalPrice: totalPrice,
        cart: cart,
      );
      if (result == true) {
        _loading = false;

        MessageHelper.showMessage(true, " Success");
        NavService.pushNamed(RouterPath.bill);
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "Failer");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, "Error Create Order $e");
      notifyListeners();
    }
  }

  Future<void> getOrderByStatusAwait() async {
    _loading = true;

    try {
      _orders.clear();
      await Future.delayed(Duration(seconds: 1));
      final result = await OrderApi.getOrderByStatusAwait();
      if (result != null) {
        _loading = false;
        _orders = result;
        print("result====>$result");
        MessageHelper.showMessage(true, "Get Order Success");
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "Not Found");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, e.toString());
      notifyListeners();
    }
  }

  Future<void> getOrderByStatusPadding() async {
    _loading = true;

    try {
      _orders.clear();
      await Future.delayed(Duration(seconds: 1));
      final result = await OrderApi.getOrderByStatusPadding();
      if (result != null) {
        _loading = false;
        _orders = result;
        MessageHelper.showMessage(true, "Get Order Success");
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "Not Found");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, e.toString());
      notifyListeners();
    }
  }

  Future<void> getOrderByStatusSuccess() async {
    _loading = true;
    try {
      _orders.clear();
      await Future.delayed(Duration(seconds: 1));
      final result = await OrderApi.getOrderByStatusSuccess();
      if (result != null) {
        _loading = false;
        _orders = result;
        MessageHelper.showMessage(true, "Get Order Success");
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "Not Found");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, e.toString());
      notifyListeners();
    }
  }
}
