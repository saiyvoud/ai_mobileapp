import 'package:ai_mobile/components/hive_database.dart';
import 'package:ai_mobile/components/messageHepler.dart';
import 'package:ai_mobile/page/auth/login_page.dart';
import 'package:ai_mobile/page/cart/cart_page.dart';
import 'package:ai_mobile/page/homework/widget/bottomHomwork.dart';
import 'package:ai_mobile/provider/auth_provider.dart';
import 'package:ai_mobile/provider/banner_provider.dart';
import 'package:ai_mobile/provider/cart_provider.dart';
import 'package:ai_mobile/provider/category_provider.dart';
import 'package:ai_mobile/provider/product_provider.dart';
import 'package:ai_mobile/router/router.dart';

import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:nav_service/nav_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<Map>("auth");
  await Hive.openBox<Map>("cart");
  await HiveDatabase.InitialHiveDatabase();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => BannerProvider()..getBanner()),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider()..getCategory(),
        ),
        ChangeNotifierProvider(create: (_) => ProductProvider()..getProduct()),
        ChangeNotifierProvider(create: (_) => CartProvider()..getCart()),
      ],
      child: MyApp(),
    ),
  );
} //wifi midi technology password   MD123456789

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "NotoSansLao"),
      navigatorKey: NavService.navigatorKey,
      scaffoldMessengerKey: MessageHelper.scaffoldMessagerKey,
      initialRoute: RouterPath.login,
      //home: CartPage(),
      onGenerateRoute: RouterPath.generateRoute,
    );
  }
}
