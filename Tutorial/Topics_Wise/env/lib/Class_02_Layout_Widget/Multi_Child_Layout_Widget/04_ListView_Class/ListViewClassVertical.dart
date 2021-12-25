import 'package:flutter/material.dart';

class ListViewClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView Class"),
        ),
        body: Container(
          child: ListView(
            /*----------------ListView Class Vertical---------------*/
            padding: EdgeInsets.all(10),
            reverse: true,
            // reverse will reverse the children
            physics: NeverScrollableScrollPhysics(),
            // if you want list to never Scrollable
            addAutomaticKeepAlives: false,
            // if you want to allow the items to be garbase colleted when off-screen
            cacheExtent: 100.0,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Container 01",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Container 02",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Container 03",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Container 04",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
