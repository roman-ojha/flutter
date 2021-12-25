import 'package:flutter/material.dart';

class ContainerClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container Widget"),
        ),
        body: Column(
          children: [
            Container(
              child: Text(
                "Container",
                style: TextStyle(fontSize: 50, color: Colors.white),
                textAlign: TextAlign.center,
              ), // child could be the Widget of the container
              //margin: const EdgeInsets.all(10), // margin of the container outside the border
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              //padding: const EdgeInsets.all(8.0), // padding of the container front he child to the border
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              // alignment: Alignment.bottomRight, // to align the child to a spacific position
              alignment: Alignment.center,
              width: 300.0,
              height: 200.0,
              // color: Colors.blue,
              transform: Matrix4.rotationZ(0.1), // to transfor the container
              transformAlignment:
                  null, // The alignment of the origin, relative to the size of the container
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5.5,
                  color: Colors.brown,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  // to shadow the box
                  BoxShadow(
                    blurRadius: 30,
                    color: Colors.black,
                    offset: Offset(1, 2),
                    spreadRadius: 10,
                  )
                ],
                color: Colors.blue,
                // Gradient
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.2,
                    0.6,
                    0.7,
                    0.9,
                  ],
                  colors: [
                    Colors.red,
                    Colors.blue,
                    Colors.yellow,
                    Colors.orange,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
