import 'package:flutter/material.dart';

class ExpandedClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expanded Class"),
        ),
        body: Row(
          /*-----Row----------*/
          children: <Widget>[
            Container(
              child: Text(
                "1",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: Colors.black),
                color: Colors.blue,
              ),
            ),
            Expanded(
              // expanded will expand the Child according the the remaining space
              flex: 2,
              // You can set a Flex factor for compitition to another 'Expanded' Widget
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "3",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                // now by using expanded in row width will automatically adjust
                height: 100,

                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.black),
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              // in previous Expanded Widget we use flex:2 and here flex:1 so now the size of this container will be 2/1
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "2",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.black),
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
