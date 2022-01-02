import 'package:flutter/material.dart';
import './home_page.dart';

class ResponsiveFlutter01 extends StatefulWidget {
  const ResponsiveFlutter01({Key? key}) : super(key: key);

  @override
  _ResponsiveFlutter01State createState() => _ResponsiveFlutter01State();
}

class _ResponsiveFlutter01State extends State<ResponsiveFlutter01> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
