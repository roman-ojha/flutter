import 'package:flutter/material.dart';

class BaseLineClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Baseline Class"),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.red,
              child: Row(
                children: <Widget>[
                  Text("Before ",
                      style: TextStyle(color: Colors.white, fontSize: 60)),
                  Text("World",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text(" Hi!!!",
                      style: TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
            ),
            /*------------------Baseline Class---------------------*/
            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 200,
              color: Colors.red,
              child: Row(
                children: <Widget>[
                  Text(
                    "After    ",
                    style: TextStyle(color: Colors.white, fontSize: 60),
                  ),
                  Baseline(
                    baseline: -30,
                    // you can change the Baseline of the child using 'Baseline' Class
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      "World",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Baseline(
                    baseline: 100,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      " Hi!!!",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
