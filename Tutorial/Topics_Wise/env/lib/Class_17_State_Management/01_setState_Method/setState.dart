import 'package:flutter/material.dart';

class SetStateMng extends StatefulWidget {
  // StatefulWidget is the Class which has to be use to be able to do State management
  @override
  _SetStateMngState createState() => _SetStateMngState();
}

class _SetStateMngState extends State<SetStateMng> {
  // Initial value
  var counter = 0;

  void increment() {
    // Incrementing function
    setState(() {
      // setState is the function which run and rerender the output display in the device
      counter++;
    });
  }

  void decrement() {
    // Decrenmenting function
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("setState"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            children: [
              TextButton(
                onPressed: increment,
                child: Text(
                  "Increment",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  backgroundColor: Colors.red,
                ),
              ),
              Text(
                "$counter",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: decrement,
                child: Text(
                  "Decrement",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  backgroundColor: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
