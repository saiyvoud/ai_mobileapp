import 'package:flutter/material.dart';

class AddressUpdate extends StatefulWidget {
  const AddressUpdate({super.key});

  @override
  State<AddressUpdate> createState() => _AddressUpdateState();
}

class _AddressUpdateState extends State<AddressUpdate> {
  final express = TextEditingController();
  final village = TextEditingController();
  final district = TextEditingController();
  final province = TextEditingController();
  final destinationPhone = TextEditingController();
  final destinationName = TextEditingController();
  final type = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ແກ້ໄຂທີ່ຢູ່",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
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
                controller: district,
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
                controller: district,
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
                controller: district,
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
                controller: district,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "ແກ້ໄຂ",
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "ລົບຂໍ້ມູນ",
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
            ],
          ),
        ),
      ),
    );
  }
}
