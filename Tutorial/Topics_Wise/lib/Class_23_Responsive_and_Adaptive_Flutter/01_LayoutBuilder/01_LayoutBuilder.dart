import 'package:flutter/material.dart';
import './home_page.dart';

class LayoutBuilderClass extends StatefulWidget {
  const LayoutBuilderClass({Key? key}) : super(key: key);

  @override
  _LayoutBuilderClassState createState() => _LayoutBuilderClassState();
}

class _LayoutBuilderClassState extends State<LayoutBuilderClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
