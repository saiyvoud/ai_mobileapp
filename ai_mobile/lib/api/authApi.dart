import 'dart:io';

import 'package:ai_mobile/api/apiPath.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  static Future<bool> Login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      //final header = {"content-type": "application/json"};
      final body = {"phoneNumber": phoneNumber, "password": password};
      final url = Uri.parse(ApiPath.login);
      final respose = await http.post(url, body: body);
      print(respose.body);
      if (respose.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> Register({
    required String fullname,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      // final header = {"content-type": "application/json"};
      final body = {
        "fullname": fullname,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
      };
      final url = Uri.parse(ApiPath.register);
      final respose = await http.post(url, body: body);
      print("=====>${respose.body}");
      if (respose.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> Forgot({
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      // final header = {"content-type": "application/json"};
      final body = {
        "phoneNumber": phoneNumber,
        "password": password,
        "confirmPassword": confirmPassword,
      };
      final url = Uri.parse(ApiPath.forgot);
      final respose = await http.put(url, body: body);
      if (respose.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> ChangePassword({
    required String newpassword,
    required String oldpassword,
  }) async {
    try {
      final header = {
        "content-type": "application/json",
        "Authorization": "Bearer token",
      };
      final body = {"newpassword": newpassword, "oldpassword": oldpassword};
      final url = Uri.parse(ApiPath.chagePassword);
      final respose = await http.put(url, body: body, headers: header);
      if (respose.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> RefreshToken() async {
    try {
      final refreshToken = "refreshToken";
      final header = {"content-type": "application/json"};
      final body = {"refreshToken": refreshToken};
      final url = Uri.parse(ApiPath.refreshToken);
      final respose = await http.put(url, body: body, headers: header);
      if (respose.statusCode == 200) {
        // local storage ຈະເກັບ token ໂຕໃຫມ່ໄວ້
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> UpdateProfile({
    required String fullname,
    required String email,
    required File file,
  }) async {
    try {
      final token = "token";
      final header = {
        "content-type": "multipart/json",
        "Authorization": "Bearer $token",
      };
      final url = Uri.parse(ApiPath.refreshToken);

      var request = http.MultipartRequest('PUT', url);

      request.fields['fullname'] = fullname;
      request.fields['email'] = email;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));
      request.headers.addAll(header);
      var response = await request.send();
      if (response.statusCode == 200) {
        // final respStr = await response.stream.bytesToString();
        // print(respStr);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
