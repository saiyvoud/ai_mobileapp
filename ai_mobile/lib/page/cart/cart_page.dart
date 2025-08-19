import 'package:ai_mobile/page/cart/widget/cart_item.dart';
import 'package:ai_mobile/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<dynamic> productData = [
    {
      "image":
          "https://img.lazcdn.com/g/p/a43455ed5ba53d4a689b66fbb8bb1a0c.jpg_200x200q80.avif",
      "title":
          "ProMan-เสื้อโปโลสีตัดกัน แขนสั้นคอปกสไตล์เดียวกันสำหรับผู้ชายและผู้หญิง เสื้อ",
      "price": "120,000",
    },
    {
      "image":
          "https://img.lazcdn.com/g/p/801bcad4a66eeab519a511d74d75bfe0.jpg_200x200q80.avif",
      "title": "พร้อมส่ง🔥เสื้อยืดโปโล Polo shirt คอปก ทรงหลวม ผู้ชาย ใส่สบาย",
      "price": "110,000",
    },
    {
      "image":
          "https://img.lazcdn.com/g/p/0d40e119dd1a61977b33939ac404cc6b.png_200x200q80.png_.webp",
      "title":
          "Muse Harbor เสื้อโปโลแขนสั้นผู้ชาย สีดำสไตล์คลาสสิกสำหรับฤดูร้อน",
      "price": "100,000",
    },
    {
      "image":
          "https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg",
      "title":
          "(ไซส์ S-4XL) เสื้อเชิ้ตแขนสั้น ผู้ชาย เสื้อเชิ้ตชาย โอเวอร์ไซส์ เสื้อฮาวาย OVERSIZE เสื้อเชิ้ต เสื้อผ้าผู้ชาย",
      "price": "130,000",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        // ),
        leading: SizedBox(),
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return IconButton(
                onPressed: () {
                  cart.getCart();
                },
                icon: Icon(Icons.refresh),
              );
            },
          ),
        ],
        title: Text(
          "Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cart, child) {
          return Container(
            height: 140,
            //decoration: BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ລາຄາທັງໝົດ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "₭${cart.totalPrice.toString()}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<CartProvider>(
                  builder: (context, cart, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          //cart.deleteCart();
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "ຊຳລະເງິນ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      body: SingleChildScrollView(child: Column(children: [CartItem()])),
    );
  }
}
