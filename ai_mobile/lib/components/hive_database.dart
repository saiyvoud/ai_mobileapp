import 'dart:convert';

import 'package:hive_ce/hive.dart';

class HiveDatabase {
  static BoxCollection? box;

  static Future<BoxCollection> InitialHiveDatabase() async {
    try {
      final collection = await BoxCollection.open(
        'Ai_Mobile', // Name of your database
        {'auth', 'cart'}, // Names of your boxes
        path: './',
      );
      box = collection;
      return collection;
    } catch (e) {
      print("Error Intail Hive Database $e");
      rethrow;
    }
  }
   static Future<bool> deleteToken() async {
    final userBox = await box!.openBox<Map>('auth');
    await userBox.deleteAll(['tokens']);

    return true;
  }
  static Future<bool> saveToken({
    required String token,
    required String refresh,
  }) async {
    final userBox = await box!.openBox<Map>('auth');

    await userBox.put("tokens", {"token": token, "refreshToken": refresh});
    return true;
  }

  static Future<dynamic> getAddress() async {
    final userBox = await box!.openBox<Map>('auth');
    final data = await userBox.getAll(['tokens']);

    return data[0];
  }

  static Future<dynamic> getToken() async {
    final userBox = await box!.openBox<Map>('auth');
    final data = await userBox.getAll(['tokens']);

    return data[0];
  }

  static Future<bool> deleteCartsAll() async {
    try {
      final cartBox = await Hive.openBox<Map>("cart");
      final data = await cartBox.clear();
      print('data====>${data}');
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> getProfile() async {
    final userBox = await box!.openBox<Map>('auth');
    final data = await userBox.getAll(['profile']);
    final respone = jsonDecode(data[0]!['data']);
    print("====>${respone}");
    return respone;
  }

  static Future<List<dynamic>?> getCarts() async {
    try {
      final cartBox = await Hive.openBox<Map>("cart");
      final data = await cartBox.values.toList();

      return data;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> removeCart({
    required dynamic cart,
    required int index,
  }) async {
    try {
      final cartBox = await Hive.openBox<Map>("cart");

      // ກວດວ່າສິນຄ້ານີ້ມີແລ້ວບໍ?
      final existIndex = cartBox.values.toList().indexWhere(
        (item) => item['_id'] == cart['_id'],
      );

      if (existIndex != -1) {
        final existing = Map<String, dynamic>.from(cartBox.getAt(existIndex)!);

        int qty = (existing['qty'] ?? 0);

        if (qty > 1) {
          // ຖ້າຍັງເຫຼືອຫຼາຍກວ່າ 1 ກໍ່ຫັກອອກ 1
          existing['qty'] = qty - 1;
          await cartBox.putAt(existIndex, existing);
        } else {
          // ຖ້າເຫຼືອ 1 ກໍ່ລົບອອກເລີຍ
          await cartBox.deleteAt(existIndex);
        }

        return true;
      } else {
        print("====> Not found in cart");
        return false;
      }
    } catch (e) {
      print("Error in removeCart: $e");
      return false;
    }
  }

  static Future<bool> saveCart({
    required dynamic cart,
    required int index,
  }) async {
    try {
      final cartBox = await Hive.openBox<Map>("cart");

      // ກວດວ່າສິນຄ້ານີ້ມີແລ້ວບໍ?
      final existIndex = cartBox.values.toList().indexWhere(
        (item) => item['_id'] == cart['_id'],
      );

      if (existIndex != -1) {
        // ຖ້າມີແລ້ວອັບເດດ qty
        final existing = Map<String, dynamic>.from(cartBox.getAt(existIndex)!);
        existing['qty'] = (existing['qty'] ?? 0) + 1;

        await cartBox.putAt(existIndex, existing);
      } else {
        // ຖ້າຍັງບໍ່ມີ ເພີ່ມໃໝ່
        await cartBox.add({
          '_id': cart['_id'],
          'name': cart['name'],
          'image': cart['image'],
          'detail': cart['detail'],
          'qty': 1,
          'price': cart['price'],
        });
      }

      return true;
    } catch (e) {
      print("SaveCart Error: $e");
      return false;
    }
  }

  static Future<bool> saveProfile({required String profile}) async {
    try {
      final cartBox = await box!.openBox<Map>("auth");
    
      await cartBox.put("profile", {"data": profile});

      return true;
    } catch (e) {
      print("SaveCart Error: $e");
      return false;
    }
  }
    static Future<bool> saveAddress({required String address}) async {
    try {
      final cartBox = await box!.openBox<Map>("auth");
      await cartBox.put("address", {"data": address});

      return true;
    } catch (e) {
      print("SaveCart Error: $e");
      return false;
    }
  }
}
