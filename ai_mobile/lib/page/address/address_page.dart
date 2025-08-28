import 'dart:convert';

import 'package:ai_mobile/components/hive_database.dart';
import 'package:ai_mobile/page/address/widget/add_address.dart';
import 'package:ai_mobile/page/address/widget/update_address.dart';
import 'package:ai_mobile/provider/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  int currentIndex = 0;
  ontap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    context.read<AddressProvider>()..getAddressBy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ທີ່ຢູ່",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddressAdd()),
          );
        },
        child: Center(child: Icon(Icons.add, color: Colors.white)),
      ),
      body: Consumer<AddressProvider>(
        builder: (context, addresProvider, child) {
          if (addresProvider.address.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: addresProvider.address.length,
                  itemBuilder: (context, index) {
                    final data = addresProvider.address;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () async{
                          ontap(index);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddressUpdate(),
                            ),
                          );
                         await HiveDatabase.saveAddress(
                            address: jsonEncode(data[index]),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          color: currentIndex == index
                              ? Colors.green
                              : Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("ຂົນສົ່ງ"),
                                        Text("${data[index]['express']}"),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("ທີ່ຢູ່"),
                                        Container(
                                          width: 200,

                                          child: Text(
                                            "${data[index]['address']}",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.end,
                                            maxLines: 3,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("ປະເພດຊຳລະ"),
                                        Text("${data[index]['paymentType']}"),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("ເບີໂທຜູ້ຮັບ"),
                                        Text(
                                          "${data[index]['destinationPhone']}",
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("ຊື່ຜູ້ຮັບ"),
                                        Text(
                                          "${data[index]['destinationName']}",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
    );
  }
}
