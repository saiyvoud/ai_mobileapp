import 'package:ai_mobile/page/auth/register_page.dart';
import 'package:ai_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  bool eye = true;
  final formKey = GlobalKey<FormState>();
  final confirmPassword = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ລືມລະຫັດຜ່ານ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),

      body: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text(
                        "ເບີໂທ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: phoneNumber,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ເບີໂທຫ້າມວ່າງ";
                        } else {
                          return null;
                        }
                      },
                      obscureText: eye,
                      decoration: InputDecoration(
                        hintText: "20xxxxx",
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
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ລະຫັດຜ່ານຫ້າມວ່າງ";
                        } else {
                          return null;
                        }
                      },
                      obscureText: eye,
                      decoration: InputDecoration(
                        hintText: "ປ້ອນລະຫັດຜ່ານໃຫມ່",
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
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        "ຢຶນຢັນລະຫັດຜ່ານ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: confirmPassword,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ຢືນຢັນລະຫັດຜ່ານຫ້າມວ່າງ";
                        } else if (value != password.text) {
                          return "ລະຫັດຜ່ານບໍ່ຕົງກັນ";
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

                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          print("====>OK");
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: auth.loading == true
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                    "ຢືນຢັນ",
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
