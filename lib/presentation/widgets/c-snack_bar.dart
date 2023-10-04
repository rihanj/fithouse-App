import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CSnackBar {

  static void errorSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
      content: Text(message,style: TextStyle(color: Colors.white),),
    ));
  }

  static void successSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
      content: Text(message,style: TextStyle(color: Colors.white),),
    ));
  }
  static SnackBar loadingSnackBar(BuildContext context,String message){
    return SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: Colors.orangeAccent,
      content: Text(message,style: TextStyle(color: Colors.white),),
    );
  }

  static void defaultSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Colors.grey.shade800,
      content: Text(message,style: TextStyle(color: Colors.orange.shade100),),
    ));
  }
}
