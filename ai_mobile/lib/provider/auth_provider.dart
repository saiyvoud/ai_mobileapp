import 'dart:io';

import 'package:ai_mobile/api/authApi.dart';
import 'package:ai_mobile/components/messageHepler.dart';
import 'package:ai_mobile/router/router.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';

class AuthProvider extends ChangeNotifier {
  bool _loading = false;
  dynamic _user;
  // ຕົວປ່ຽນທີ່ເອີ້ນອອກໄປໃສ່ຫນ້າອື່ນໄດ້
  bool get loading => _loading;
  dynamic get user => _user;
  Future<void> getProfile() async {
    _loading = true;
  
    try {
      await Future.delayed(Duration(seconds: 1));
      final result = await AuthApi.getProfile();
      if (result != null) {
        _loading = false;
        _user = result;

        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "Bad Request");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, "Error get profile");
      notifyListeners();
    }
  }

  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final result = await AuthApi.Login(
        phoneNumber: phoneNumber,
        password: password,
      );
      if (result == true) {
        _loading = false;
        MessageHelper.showMessage(true, "Login Success");
        NavService.pushNamed(RouterPath.bottomBar);
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "Bad Request");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, "Error Login");
      notifyListeners();
    }
  }

  Future<void> Register({
    required String fullname,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AuthApi.Register(
        phoneNumber: phoneNumber,
        password: password,
        fullname: fullname,
        email: email,
      );
      if (result == true) {
        _loading = false;
        MessageHelper.showMessage(true, "Register Success");
        NavService.pushReplacementNamed(RouterPath.login);
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "Bad Request");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, e.toString());
      notifyListeners();
    }
  }

  Future<void> Forgot({
    required String phoneNumber,
    required String password,
    required String confrimPassword,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AuthApi.Forgot(
        phoneNumber: phoneNumber,
        password: password,
        confirmPassword: confrimPassword,
      );
      if (result == true) {
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> RefreshToken() async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AuthApi.RefreshToken();
      if (result == true) {
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> ChangePassword({
    required String newpassword,
    required String oldpassword,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AuthApi.ChangePassword(
        newpassword: newpassword,
        oldpassword: oldpassword,
      );
      if (result == true) {
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> UpdateProfile({
    required String fullname,
    required String email,
    required File file,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AuthApi.UpdateProfile(
        fullname: fullname,
        email: email,
        file: file,
      );
      if (result == true) {
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }
}
