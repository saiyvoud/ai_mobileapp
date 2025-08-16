import 'package:ai_mobile/view/multiChildWidget/Coloum_widget.dart';
import 'package:ai_mobile/view/multiChildWidget/row_widget.dart';
import 'package:ai_mobile/view/multiChildWidget/stack_widget.dart';
import 'package:ai_mobile/view/singleChildWidget/container_widget.dart';
import 'package:ai_mobile/view/singleChildWidget/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class SliverScroll extends StatefulWidget {
  const SliverScroll({super.key});

  @override
  State<SliverScroll> createState() => _SliverScrollState();
}

class _SliverScrollState extends State<SliverScroll> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 200,
            backgroundColor: Colors.red,
            pinned: false,
            leading: Icon(Icons.menu),
            centerTitle: true,
            title: Text("AI+Mobile App"),
            actions: [Icon(Icons.person)],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              TextFormFieldWidget(),
              ContainerWidget(),
              ColoumWidget(),
              RowWidget(),
              StackWidget(),
            ]),
          ),
        ],
      ),
    );
  }
}
