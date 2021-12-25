import 'package:flutter/material.dart';

class CenterClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Center Class"),
        ),
        body: Container(
          child: Center(
            // Center Widget will center the child according the the parent of the own
            // widthFactor: 5.0,
            // heightFactor: 7.0,
            child: Text("Hello"),
          ),
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 5.5),
          ),
        ),
      ),
    );
  }
}
