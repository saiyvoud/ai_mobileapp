import 'dart:io';

import 'package:ai_mobile/api/authApi.dart';
import 'package:ai_mobile/api/bannerApi.dart';
import 'package:ai_mobile/components/messageHepler.dart';
import 'package:ai_mobile/router/router.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';

class BannerProvider extends ChangeNotifier {
  bool _loading = false;
  List<dynamic> _banners = [];
  // ຕົວປ່ຽນທີ່ເອີ້ນອອກໄປໃສ່ຫນ້າອື່ນໄດ້
  bool get loading => _loading;
  List<dynamic> get banners => _banners;

  Future<void> getBanner() async {
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final result = await BannerApi.getBanner();
      if (result != null) {
        _loading = false;
        _banners = result;
        MessageHelper.showMessage(true, "Get Banner Success");
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "Not Found");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, "Error get banner");
      notifyListeners();
    }
  }

  
}
