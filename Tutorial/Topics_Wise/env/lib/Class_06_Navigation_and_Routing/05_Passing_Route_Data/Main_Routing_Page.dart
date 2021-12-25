import 'package:flutter/material.dart';
import 'First_Routing_Page.dart';
import 'Second_Routing_Page.dart';

class RoutingPassingDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/second',
      routes: {
        '/': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
