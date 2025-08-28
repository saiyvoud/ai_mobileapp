import 'package:ai_mobile/components/messageHepler.dart';
import 'package:ai_mobile/provider/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressAdd extends StatefulWidget {
  const AddressAdd({super.key});

  @override
  State<AddressAdd> createState() => _AddressAddState();
}

class _AddressAddState extends State<AddressAdd> {
  final express = TextEditingController();
  final address = TextEditingController();
  final paymentType = TextEditingController();
  final destinationPhone = TextEditingController();
  final destinationName = TextEditingController();
  final type = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ເພີ່ມທີ່ຢູ່",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),

      body: Consumer<AddressProvider>(
        builder: (context, addressProvider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    child: Text(
                      "ຂົນສົ່ງ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: express,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ປະເພດຂົນສົ່ງຫ້າມວ່າງ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "ປະເພດຂົນສົ່ງ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      prefixIcon: Icon(Icons.fire_truck),
                      errorBorder: OutlineInputBorder(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      "ທີ່ຢູ່",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: address,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ທີ່ຢູ່ຫ້າມວ່າງ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "ບ້ານ ເມືອງ ແຂວງ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      prefixIcon: Icon(Icons.location_city),

                      errorBorder: OutlineInputBorder(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      "ປະເພດຊຳລະ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: paymentType,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ທີ່ຢູ່ຫ້າມວ່າງ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "ປາຍທາງ ຫລື ຕົ້ນທາງ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      prefixIcon: Icon(Icons.delivery_dining),

                      errorBorder: OutlineInputBorder(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      "ຊື່ຜູ້ຮັບ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: destinationName,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ຊື່ຜູ້ຮັບຫ້າມວ່າງ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "ຊື່ຜູ້ຮັບ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      prefixIcon: Icon(Icons.person_2_outlined),

                      errorBorder: OutlineInputBorder(),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      "ເບີໂທຜູ້ຮັບ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: destinationPhone,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ເບີໂທຜູ້ຮັບຫ້າມວ່າງ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "ເບີໂທຜູ້ຮັບ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      prefixIcon: Icon(Icons.person_2_outlined),

                      errorBorder: OutlineInputBorder(),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        if (express.text.isEmpty) {
                          MessageHelper.showMessage(false, "ຂົນສົ່ງຫ້າມວ່າງ");
                        } else if (address.text.isEmpty) {
                          MessageHelper.showMessage(false, "ທິ່ຢູ່ ຫ້າມວ່າງ");
                        } else if (paymentType.text.isEmpty) {
                          MessageHelper.showMessage(false, "ປະເພດຊຳລະ ຫ້າມວ່າງ");
                        } else if (destinationName.text.isEmpty) {
                          MessageHelper.showMessage(false, "ຊື່ຜູ້ຮັບຫ້າມວ່າງ");
                        } else if (destinationPhone.text.isEmpty) {
                           MessageHelper.showMessage(false, "ເບີໂທຜູ້ຮັບຫ້າມວ່າງ");
                        } else {
                          addressProvider.saveAddress(
                            express: express.text,
                            address: address.text,
                            paymentType: paymentType.text,
                            destinationName: destinationName.text,
                            destinationPhone: destinationPhone.text,
                          );
                        }
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "ບັນທຶກ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
