
import 'package:flutter/material.dart';

class MessageHelper {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessagerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showMessage(bool isSuccess, String message) {
    scaffoldMessagerKey.currentState!.showSnackBar(
      
      SnackBar(
        duration: Duration(seconds: 1),
        backgroundColor: isSuccess ? Colors.green: Colors.red,
        padding: EdgeInsets.all(18),
        content: Text(
          message,
          style: TextStyle(
            fontSize: 16,
            backgroundColor: isSuccess ? Colors.green : Colors.red,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
