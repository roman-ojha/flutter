import 'package:flutter/material.dart';

class Practice03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget myWidget() {
      return Text("Hello");
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Practice 03",
          ),
        ),
        body: Column(children: [
          Container(
            width: double.infinity,
            child: Text("This is the text by the flutter"),
          ),
          Container(
            child: myWidget(),
          )
        ]),
      ),
    );
  }
}
