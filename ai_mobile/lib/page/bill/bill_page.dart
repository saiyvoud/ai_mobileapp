import 'package:ai_mobile/components/hive_database.dart';
import 'package:ai_mobile/page/address/address_page.dart';
import 'package:ai_mobile/provider/auth_provider.dart';
import 'package:ai_mobile/provider/cart_provider.dart';
import 'package:ai_mobile/router/router.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';
import 'package:provider/provider.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<AuthProvider>()..getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox(),
        centerTitle: true,
        title: Text("ໃບບິນ"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 20, left: 20),
        child: Consumer<CartProvider>(
          builder: (context,cart,child) {
            return GestureDetector(
              onTap: ()async{
                await HiveDatabase.deleteCartsAll();
                cart.getCart();
                NavService.pushReplacementNamed(RouterPath.bottomBar);
                
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "ສຳເລັດ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Center(
                          child: Text(
                            "ຂໍ້ມູນສ່ວນຕົວ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Consumer<AuthProvider>(
                        builder: (context, auth, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ຊື່ ແລະ ນາມສະກຸນ"),
                                Text("${auth.user['fullname']}"),
                              ],
                            ),
                          );
                        },
                      ),
                      Consumer<AuthProvider>(
                        builder: (context, auth, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ເບີໂທ"),
                                Text("${auth.user['phoneNumber'].toString()}"),
                              ],
                            ),
                          );
                        },
                      ),
                      Consumer<AuthProvider>(
                        builder: (context, auth, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ອີເມວ"),
                                Text("${auth.user['email'].toString()}"),
                              ],
                            ),
                          );
                        },
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ລາຍລະອຽດຈັດສົ່ງ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                         
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ປະເພດການຈັດສົ່ງ"),
                            Text("ສົ່ງເອງ ຫລື ຝາກຂົນສົ່ງ"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("ເບີໂທລູກຄ້າ"), Text("20 96794376")],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ທີ່ຢູ່"),
                            Text(
                              "ບ້ານ ທົ່ງສາງນາງ ເມືອງຈັນທະບູລີ ນະຄອນຫຼວວຽງຈັນ",
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Center(
                        child: Text(
                          "ລາຍລະອຽດສິນຄ້າ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("ຊື່"), Text("ຈຳນວນ"), Text("ລາຄາ")],
                        ),
                      ),
                      Consumer<CartProvider>(
                        builder: (context, cart, child) {
                          return ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: cart.carts.length,
                            itemBuilder: (context, index) {
                              final data = cart.carts;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 100,
                                      //decoration: BoxDecoration(color: Colors.red),
                                      child: Text(data[index]['name']),
                                    ),
                                    Text(data[index]['qty'].toString()),
                                    Text(data[index]['price'].toString()),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Divider(),
                      Center(
                        child: Text(
                          "ລາຍລະອຽດຊຳລະ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("ປະເພດການຊຳ"), Text("ປາຍທາງ")],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ລາຄາລວມ"),
                            Text(
                              cart.totalPrice.toString(),
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                          Container(height: 1, width: 200, color: Colors.grey),

                          Container(
                            height: 40,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          "ຂອບໃຈ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
