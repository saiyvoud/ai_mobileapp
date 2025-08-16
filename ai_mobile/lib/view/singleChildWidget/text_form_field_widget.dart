import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({super.key});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
      child: TextFormField(
        controller: null,
        validator: (value) {
          if (value!.isEmpty) {
            return "Required!";
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'ສະບາຍດີ',
          label: Text('ຫົວຂໍ້'),
          prefixIcon: Icon(Icons.home,color: Colors.red,),
          errorBorder: OutlineInputBorder(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
