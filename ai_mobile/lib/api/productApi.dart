import 'dart:convert';

import 'package:ai_mobile/api/apiPath.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static Future<List<dynamic>?> getProduct() async {
    try {
      final url = Uri.parse(ApiPath.getProductAll);
      final respose = await http.get(url);
      
      if (respose.statusCode == 200) {
        final data = jsonDecode(respose.body);
        return data['data'];
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
  static Future<List<dynamic>?> getProductBy({
    required String categoryId
  }) async {
    try {
      final url = Uri.parse(ApiPath.getProductBy + categoryId);
      final respose = await http.get(url);
     
      if (respose.statusCode == 200) {
        final data = jsonDecode(respose.body);
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
