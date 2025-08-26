import 'package:ai_mobile/page/address/widget/add_address.dart';
import 'package:ai_mobile/page/address/widget/update_address.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      ontap(index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddressUpdate(),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      color: currentIndex == index?  Colors.green : Colors.white,
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
                                    Text("ຮຸ່ງອາລຸ້ນ"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("ທີ່ຢູ່"),
                                    Text(
                                      "ບ້ານ ທົ່ງສ້າງນາງ ເມືອງ ຈັນທະບູລີ ນະຄອນຫຼວງວຽງຈັນ",
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [Text("ປະເພດຊຳລະ"), Text("ປາຍທາງ")],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("ເບີໂທຜູ້ຮັບ"),
                                    Text("020 96794376"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("ຊື່ຜູ້ຮັບ"),
                                    Text("Yang Xong"),
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
      ),
    );
  }
}
