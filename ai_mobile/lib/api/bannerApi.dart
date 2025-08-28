import 'dart:convert';

import 'package:ai_mobile/api/apiPath.dart';
import 'package:http/http.dart' as http;

class BannerApi {
  static Future<List<dynamic>?> getBanner() async {
    try {
      final url = Uri.parse(ApiPath.getBannerAll);
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
