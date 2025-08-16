import 'package:ai_mobile/view/multiChildWidget/Coloum_widget.dart';
import 'package:ai_mobile/view/multiChildWidget/row_widget.dart';
import 'package:ai_mobile/view/multiChildWidget/stack_widget.dart';
import 'package:ai_mobile/view/singleChildWidget/container_widget.dart';
import 'package:ai_mobile/view/singleChildWidget/text_form_field_widget.dart';
import 'package:ai_mobile/view/singleChildWidget/text_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(Icons.menu, color: Colors.white),
        centerTitle: true,
        actions: [Icon(Icons.person, color: Colors.white, size: 30)],
        title: Text(
          "Ai+Mobile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormFieldWidget(),
            ContainerWidget(),
            ColoumWidget(),
            RowWidget(),
            StackWidget(),
          ],
        ),
      ),
    );
  }
}
