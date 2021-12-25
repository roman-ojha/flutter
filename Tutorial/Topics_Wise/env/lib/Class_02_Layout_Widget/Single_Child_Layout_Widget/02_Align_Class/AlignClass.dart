import 'package:flutter/material.dart';

class AlignClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Align Class"),
        ),
        body: Column(
          children: [
            Container(
              // here we ca use Align widget to align the child way we want
              child: Align(
                child: FlutterLogo(
                  size: 100,
                ),
                // to align the child in spacific area
                // alignment: Alignment.bottomLeft,
                // alignment: Alignment.bottomRight,
                // alignment: Alignment.bottomCenter,
                // alignment: Alignment.center,
                // alignment: Alignment.centerLeft,
                // alignment: Alignment.centerRight,
                // alignment: Alignment.topCenter,
                // alignment: Alignment.topLeft,
                // alignment: Alignment.topRight,
                // alignment: Alignment(0.11, 0.411), // top to buttom(-1,1), left to right(-1,1) and origin from the center of the container
                alignment: FractionalOffset(
                    0.2, 0.6), // orign from the top-left corner
              ),
              width: 300,
              height: 200,
              // color: Colors.lightGreenAccent,
              color: Color.fromRGBO(130, 0, 120, 0.5),
              margin: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}
