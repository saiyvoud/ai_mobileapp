import 'package:flutter/material.dart';

class OrderPadding extends StatefulWidget {
  const OrderPadding({super.key});

  @override
  State<OrderPadding> createState() => _OrderPaddingState();
}

class _OrderPaddingState extends State<OrderPadding> {
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