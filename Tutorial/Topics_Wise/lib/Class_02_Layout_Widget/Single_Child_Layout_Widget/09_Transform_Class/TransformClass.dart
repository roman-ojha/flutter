import 'package:flutter/material.dart';

class TrasnsformClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Transform Class"),
        ),
        body: ListView(
          padding: EdgeInsets.all(50),
          children: [
            Transform.rotate(
              // Transform.rotate will rotate the Child
              origin: Offset(100, 100),
              // to determine the Transform origin to rotate child
              angle: 0.1,
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(40),
                width: 200,
                height: 200,
                color: Colors.orange,
              ),
            ),
            Transform.translate(
              offset: Offset(50, 50),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            ),
            Transform.scale(
              scale: 1.2,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ),
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateX(0.6),
              alignment: FractionalOffset.center,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.purple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
