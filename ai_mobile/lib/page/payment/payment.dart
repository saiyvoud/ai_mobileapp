import 'package:ai_mobile/page/address/address_page.dart';
import 'package:ai_mobile/page/bill/bill_page.dart';
import 'package:ai_mobile/provider/address_provider.dart';
import 'package:ai_mobile/provider/auth_provider.dart';
import 'package:ai_mobile/provider/cart_provider.dart';
import 'package:ai_mobile/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    // TODO: implement initState

    context.read<AuthProvider>()..getProfile();
    context.read<AddressProvider>()..getAddressOne();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(centerTitle: true, title: Text("ຊຳລະເງິນ")),
          bottomNavigationBar: Consumer<OrderProvider>(
            builder: (context, order, child) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 40, right: 20, left: 20),
                child: GestureDetector(
                  onTap: () {
                    order.createOrder(
                      totalPrice: cart.totalPrice,
                      cart: cart.carts,
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: order.loading == true
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Center(
                            child: Text(
                              "ຢືນຢັນ",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                ),
              );
            },
          ),
          body: Consumer<CartProvider>(
            builder: (context, cart, child) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
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
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddressPage(),
                                ),
                              );
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                      Consumer<AddressProvider>(
                        builder: (context, addressProvider, child) {
                          if (addressProvider.addressOne == null) {
                            return Center(child: CircularProgressIndicator());
                          }
                          final data = addressProvider.addressOne;
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("ປະເພດການຈັດສົ່ງ"),
                                    Text("${data['express']}"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("ເບີໂທລູກຄ້າ"),
                                    Text("${data['destinationPhone']}"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("ຊື່ລູກຄ້າ"),
                                    Text("${data['destinationName']}"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("ທີ່ຢູ່"),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        "${data['address']}",
                                        maxLines: 3,
                                        textAlign: TextAlign.end,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
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
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
