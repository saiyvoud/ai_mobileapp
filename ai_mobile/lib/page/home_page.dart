import 'package:ai_mobile/page/widget/appbar_widget.dart';
import 'package:ai_mobile/page/widget/banner_widget.dart';
import 'package:ai_mobile/page/widget/category_widget.dart';
import 'package:ai_mobile/page/widget/page_controller_widget.dart';
import 'package:ai_mobile/page/widget/product_widget.dart';
import 'package:ai_mobile/provider/banner_provider.dart';
import 'package:ai_mobile/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),

      body: CustomScrollView(
        slivers: [
          // Header Banner & Section
          SliverList(
            delegate: SliverChildListDelegate([
              BannerWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Office Band",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () => print("Office Band Clicked"),
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
      
          /// ✅ SliverStickyHeader ໃຫ້ຢູ່ນອກ SliverList
          ///   
          CategoryWidget(),
      
          // ✅ Continue with Best Seller Section
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Seller",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () => print("Best Seller Clicked"),
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ProductWidget(),
            ]),
          ),
        ],
      ),
    );
  }
}
