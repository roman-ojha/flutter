import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dart Data type
    int days = 40;
    // double days2 = 44.4;
    String name = "Roman";
    bool isMale = true;
    // num temp = 30.5;
    // var day = "Sunday";
    // const PI = 3.14;

    return Scaffold(
        // scaffold is the widget have a lot of wedget
        appBar: AppBar(),
        // appBar is like a body
        body: Center(
            child: Container(
          child: Text("Welcome to $days days of flutter by $name $isMale"),
        )));
  }
}
