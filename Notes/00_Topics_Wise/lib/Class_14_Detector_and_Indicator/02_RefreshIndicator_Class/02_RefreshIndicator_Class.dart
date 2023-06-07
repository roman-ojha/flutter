import 'package:flutter/material.dart';

class RefreshIndicatorClass extends StatefulWidget {
  const RefreshIndicatorClass({Key? key}) : super(key: key);

  @override
  _RefreshIndicatorClassState createState() => _RefreshIndicatorClassState();
}

class _RefreshIndicatorClassState extends State<RefreshIndicatorClass> {
  Future<Null> _refresh() async {
    print("Hello we are refreshing ");
  }

  final _items = [
    "item 01",
    "item 02",
    "item 03",
    "item 04",
    "item 05",
    "item 06",
    "item 07",
    "item 08"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("RefreshIndicatorClass"),
        ),
        body: Container(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: _items.map((item) {
                return ListTile(
                  title: Text(item),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
