import 'package:flutter/material.dart';

class OrderSuccess extends StatefulWidget {
  const OrderSuccess({super.key});

  @override
  State<OrderSuccess> createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 3,
      itemBuilder: (context,index){
      return Container();
    });
  }
}