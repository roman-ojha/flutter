import 'package:flutter/material.dart';
import 'SecondPage.dart';
import 'FirstPage.dart';

class StateFullWidgetClass extends StatefulWidget {
  State<StateFullWidgetClass> createState() => _StateFullWidgetClassState();
}

class _StateFullWidgetClassState extends State<StateFullWidgetClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
      },
    );
  }
}
