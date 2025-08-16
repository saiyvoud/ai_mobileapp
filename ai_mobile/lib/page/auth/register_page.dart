import 'package:ai_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool eye = true;
  final formKey = GlobalKey<FormState>();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final fullname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ລົງທະບຽນ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ທ່ານມີບັນຊີແລ້ວແມ່ນບໍ່!", style: TextStyle(fontSize: 15)),
            TextButton(
              onPressed: () {},
              child: Text(
                "ເຂົ້າສູ່ລະບົບ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/icons/logo.png",
                            fit: BoxFit.cover,
                            height: 64,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "LABook",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    //--- fullname
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text(
                        "ຊື່ແລະນາມສະກຸນ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: fullname,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ຊື່ ແລະ ນາມສະກຸນຫ້າມວ່າງ";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "ຊື່ແລະນາມສະກຸນ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        prefixIcon: Icon(Icons.person),
                        errorBorder: OutlineInputBorder(),
                      ),
                    ),

                    // --- email
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        "ອີເມວ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ອີເມວຫ້າມວ່າງ";
                        } else if (!value.contains("@gmail.com")) {
                          return "@gmail.com ຕ້ອງມີ";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "example@gmail.com",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        prefixIcon: Icon(Icons.email),
                        errorBorder: OutlineInputBorder(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text(
                        "ເບີໂທລະສັບ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: phoneNumber,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ເບີໂທຫ້າມວ່າງ";
                        } else if (value.length < 10) {
                          return "ເບີໂທຕ້ອງມີ 10 ຕົວເລກ";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "20xxxxxxx",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        prefixIcon: Icon(Icons.phone),
                        errorBorder: OutlineInputBorder(),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        "ລະຫັດຜ່ານ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: password,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ລະຫັດຜ່ານຫ້າມວ່າງ";
                        } else if (value.length < 5) {
                          return "ລະຫັດຜ່ານຕ້ອງມີ 5 ຕົວເລກຂື້ນໄປ";
                        } else {
                          return null;
                        }
                      },
                      obscureText: eye,
                      decoration: InputDecoration(
                        hintText: "******",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        prefixIcon: Icon(Icons.security),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              eye = !eye;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye),
                        ),
                        errorBorder: OutlineInputBorder(),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            auth.Register(
                              fullname: fullname.text,
                              email: email.text,
                              phoneNumber: phoneNumber.text,
                              password: password.text,
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: auth.loading == true
                                  ? CircularProgressIndicator()
                                  : Text(
                                      "ລົງທະບຽນ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
