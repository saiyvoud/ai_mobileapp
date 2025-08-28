import 'dart:convert';

import 'package:ai_mobile/api/apiPath.dart';
import 'package:ai_mobile/components/hive_database.dart';
import 'package:http/http.dart' as http;

class AddressApi {
  static Future<bool> saveAddress({
    required String express,
    required String address,
    required String paymentType,
    required String destinationName,
    required String destinationPhone,
  }) async {
    try {
      final token = await HiveDatabase.getToken();
      final header = {"Authorization": "Bearer ${token['token']}"};
      final body = {
        "express": express,

        "address": address,
        "paymentType": paymentType,
        "destinationName": destinationName,
        "destinationPhone": destinationPhone,
      };
      final url = Uri.parse(ApiPath.createAddress);
      final respose = await http.post(url, body: body, headers: header);
      final convert = jsonDecode(respose.body);
      if (respose.statusCode == 200) {
        await HiveDatabase.saveAddress(address: jsonEncode(convert['data']));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> updateAddress({
    required String express,
    required String address,
    required String paymentType,
    required String destinationName,
    required String destinationPhone,
    required String id,
  }) async {
    try {
      final token = await HiveDatabase.getToken();
      final header = {
        "content-type": "application/json",
        "Authorization": "Bearer ${token['token']}",
      };
      final body = {
        "express": express,
        "address": address,
        "paymentType": paymentType,
        "destinationName": destinationName,
        "destinationPhone": destinationPhone,
      };
      final url = Uri.parse(ApiPath.updateAddress + id);
      final respose = await http.post(url, body: body, headers: header);
      final convert = jsonDecode(respose.body);
      if (respose.statusCode == 200) {
        await HiveDatabase.saveAddress(address: jsonEncode(convert['data']));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> deleteAddress({required String id}) async {
    try {
      final token = await HiveDatabase.getToken();
      final header = {
        "content-type": "application/json",
        "Authorization": "Bearer ${token['token']}",
      };
      final url = Uri.parse(ApiPath.deleteAddress + id);
      final respose = await http.delete(url, headers: header);
      final convert = jsonDecode(respose.body);
      if (respose.statusCode == 200) {
        await HiveDatabase.saveAddress(address: jsonEncode(convert['data']));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<List<dynamic>?> getAddresUser() async {
    try {
      final token = await HiveDatabase.getToken();

      final header = {"Authorization": "Bearer ${token['token']}"};

      final url = Uri.parse(ApiPath.getAddressByUser);
      final respose = await http.get(url, headers: header);
      final data = jsonDecode(respose.body);
    
      if (respose.statusCode == 200) {
        return data['data'];
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
