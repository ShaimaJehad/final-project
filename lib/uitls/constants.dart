import 'package:flutter/material.dart';

showSnackBar({context,message,error}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message, textAlign: TextAlign.center),
    backgroundColor: error?Colors.red:Colors.green,

  ));
}