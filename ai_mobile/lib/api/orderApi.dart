import 'dart:convert';

import 'package:ai_mobile/api/apiPath.dart';
import 'package:ai_mobile/components/hive_database.dart';
import 'package:http/http.dart' as http;

class OrderApi {
  static Future<bool> createOrder({
    required int totalPrice,
    required dynamic cart,
  }) async {
    try {
      final url = Uri.parse(ApiPath.createOrder);
      final address = await HiveDatabase.getAddress();
      final token = await HiveDatabase.getToken();
      final header = {"Authorization": "Bearer ${token['token']}"};
      final body = {
        "addressId": address['_id'],
        "totalPrice": totalPrice.toString(),
        "products": cart.toString(),
      };
      final respose = await http.post(url, body: body, headers: header);
        print("result == >${respose.body}");
      if (respose.statusCode == 200) {
        return true;
      } else {
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<List<dynamic>?> getOrderByStatusAwait() async {
    try {
    
      final user = await HiveDatabase.getProfile();
      final token = await HiveDatabase.getToken();
      final header = {"Authorization": "${token['token']}"};
      final url = Uri.parse(ApiPath.getOrderByStatusAwait + user['_id']);
      final respose = await http.get(url, headers: header);
      final convert = jsonDecode(respose.body);
      print("order ai ${respose.body}");
      if (respose.statusCode == 200) {
        return convert['data'];
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
    static Future<List<dynamic>?> getOrderByStatusPadding() async {
    try {
       final user = await HiveDatabase.getProfile();
      final token = await HiveDatabase.getToken();
      final header = {"Authorization": "${token['token']}"};
      final url = Uri.parse(ApiPath.getOrderByStatusPadding + user['_id']);
      final respose = await http.get(url, headers: header);
      final convert = jsonDecode(respose.body);
      if (respose.statusCode == 200) {
        return convert['data'];
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
    static Future<List<dynamic>?> getOrderByStatusSuccess() async {
    try {
       final user = await HiveDatabase.getProfile();
      final token = await HiveDatabase.getToken();
      final header = {"Authorization": "${token['token']}"};
      final url = Uri.parse(ApiPath.getOrderByStatusSuccess + user['_id']);

      final respose = await http.get(url, headers: header);
      final convert = jsonDecode(respose.body);
      if (respose.statusCode == 200) {
        return convert['data'];
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
