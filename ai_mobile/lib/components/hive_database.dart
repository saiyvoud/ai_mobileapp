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
static Future<List<dynamic>?> getCarts()async{
  try {
    final cartBox= await Hive.openBox<Map>("cart");
    final data = await cartBox.values.toList();
    return data;
  } catch (e) {
    return null;
  }
 }
static Future<bool> saveCart({required dynamic cart,required int index}) async {
  try {
    final cartBox = await Hive.openBox<Map>("cart");

    // ກວດວ່າສິນຄ້ານີ້ມີແລ້ວບໍ?
    final existIndex = cartBox.values.toList().indexWhere(
      (item) => item['_id'] == cart['_id'],
    );

    if (existIndex != -1) {
      // ຖ້າມີແລ້ວອັບເດດ qty
      final existing = Map<String, dynamic>.from(cartBox.getAt(existIndex)!);
      existing['amount'] = (existing['amount'] ?? 0) + (cart['amount'] ?? 0);

      await cartBox.putAt(existIndex, existing);
    } else {
      // ຖ້າຍັງບໍ່ມີ ເພີ່ມໃໝ່
      await cartBox.add(cart);
    }

    return true;
  } catch (e) {
    print("SaveCart Error: $e");
    return false;
  }
}

}
