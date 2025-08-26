import 'package:ai_mobile/api/addressApi.dart';
import 'package:ai_mobile/components/hive_database.dart';
import 'package:ai_mobile/components/messageHepler.dart';
import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  bool _loading = false;
  List<dynamic> _address = [];

  // ຕົວປ່ຽນທີ່ເອີ້ນອອກໄປໃສ່ຫນ້າອື່ນໄດ້
  bool get loading => _loading;
  List<dynamic> get address => _address;

  Future<void> saveAddress({
    required String express,
    required String address,
    required String paymentType,
    required String destinationName,
    required String destinationPhone,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AddressApi.saveAddress(
        express: express,
        address: address,
        paymentType: paymentType,
        destinationName: destinationName,
        destinationPhone: destinationPhone,
      );
      if (result == true) {
        _loading = false;
        MessageHelper.showMessage(true, "Add Cart Success");

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

  Future<void> updateAddress({
    required String express,
    required String address,
    required String paymentType,
    required String destinationName,
    required String destinationPhone,
    required String id,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AddressApi.updateAddress(
        express: express,
        address: address,
        paymentType: paymentType,
        destinationName: destinationName,
        destinationPhone: destinationPhone,
        id: id,
      );
      if (result == true) {
        _loading = false;
        MessageHelper.showMessage(true, "update Success");

        notifyListeners();
      } else {
        MessageHelper.showMessage(false, "Falid");
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      MessageHelper.showMessage(true, e.toString());
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> deleteAddress({required String id}) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AddressApi.deleteAddress(id: id);
      if (result == true) {
        _loading = false;
        MessageHelper.showMessage(true, "update Success");

        notifyListeners();
      } else {
        MessageHelper.showMessage(false, "Falid");
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      MessageHelper.showMessage(true, e.toString());
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> getAddressBy() async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AddressApi.getAddresUser();
      if (result == true) {
        _loading = false;
        _address = result!;
        notifyListeners();
      } else {
        MessageHelper.showMessage(false, "Falid");
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      MessageHelper.showMessage(true, e.toString());
      _loading = false;
      notifyListeners();
    }
  }
}
