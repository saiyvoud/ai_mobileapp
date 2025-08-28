import 'package:ai_mobile/page/order/await/order_await.dart';
import 'package:ai_mobile/page/order/padding/order_padding.dart';
import 'package:ai_mobile/page/order/success/order_success.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  List<String> status = ["ລໍຖ້າ", "ກຳລັງຈັດສົ່ງ", "ສຳເລັດ"];
  int currentIndex = 0;
  ontap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text(
          "My Order",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                itemCount: status.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ontap(index);
                    },
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? Colors.green
                                : Colors.transparent,
                            border: Border.all(
                              color: currentIndex == index
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                status[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: currentIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  );
                },
              ),
            ),

            currentIndex == 0
                ? OrderAwait()
                : currentIndex == 1
                ? OrderPadding()
                : currentIndex == 2
                ? OrderSuccess()
                : OrderAwait(),
          ],
        ),
      ),
    );
  }
}
