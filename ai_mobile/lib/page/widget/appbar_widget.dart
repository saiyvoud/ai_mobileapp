import 'package:flutter/material.dart';

appBarWidget () {
  return AppBar(
    leading: Text(''),
    leadingWidth: 0,
    title: Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search Product ...",
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, size: 30),
        ),
      ),
    ),
    actions: [
      Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(55),
          color: Colors.grey.shade300,
        ),
        child: Stack(
          children: [
            Center(child: Icon(Icons.notifications_none_sharp)),
            Positioned(
              top: 5,
              right: 10,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    "30",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
