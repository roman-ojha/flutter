import 'package:flutter/material.dart';


class Practice01 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<Practice01> {
  int initialValue = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Increment/Decrement App"),
        ),
        body: Column(children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 50),
            color: Colors.deepOrange,
            child: Center(
              child: Text(
                initialValue.toString(),
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            // color: Colors.blue,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: TextButton(
              child: Text(
                "Increment",
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  initialValue++;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: TextButton(
              child: Text(
                "Decrement",
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  initialValue--;
                });
              },
            ),
          )
        ]),
      ),
    );
  }
}
