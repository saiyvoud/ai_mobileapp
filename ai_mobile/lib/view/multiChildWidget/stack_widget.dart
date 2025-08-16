import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 100, width: 200, color: Colors.green),
        Positioned(
          top: 5,
          right: 5,
          left: 5,
          bottom: 5,
          child: Container(height: 100, width: 200, color: Colors.orange),
        ),
        Positioned(
          top: 20,
          right: 20,
          left: 20,
          child: Container(height: 100, width: 200, color: Colors.red),
        ),
      ],
    );
  }
}
