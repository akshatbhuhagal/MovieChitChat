import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonUtils {

  /*     Toast/SnackBar     */
  static void showSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.blueAccent,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(50),
      elevation: 30,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /*     Getting Current time in hours and min     */
  static String getCurrentTime(){
    return "${DateFormat.jm().format(DateTime.now())}";
  }

}