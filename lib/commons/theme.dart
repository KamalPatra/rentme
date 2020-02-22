import 'package:flutter/material.dart';

LinearGradient gradientColorBackground = LinearGradient(
    colors: [Colors.blueAccent, Colors.deepPurpleAccent],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);

LinearGradient gradientColorText = LinearGradient(
    colors: [Colors.deepPurpleAccent, Colors.blueAccent],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);

void changeScreen(BuildContext context, Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void changeScreenReplacement(BuildContext context, Widget widget){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
}