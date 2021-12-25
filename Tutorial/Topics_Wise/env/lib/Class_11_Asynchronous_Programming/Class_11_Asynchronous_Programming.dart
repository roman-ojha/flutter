import 'package:flutter/material.dart';

class AsynchronousProgramming extends StatefulWidget {
  State<AsynchronousProgramming> createState() =>
      _AsynchronousProgrammingState();
}

class _AsynchronousProgrammingState extends State<AsynchronousProgramming> {
  // To perform the Asynchronous Programming we have:
  // Future, Async and Await
  String name = "";
  void getData() async {
    //  Simulate network request for a username
    await Future.delayed(Duration(seconds: 2), () {
      // it is same like setTimeOut() in javascript
      setState(() {
        name = "Roman";
      });
    });
  }

  Future<String> downLoadAFile() {
    // To download a file [Dummy long running operation]
    Future<String> result = Future.delayed(
      // here in 'result', In Future we will get the String value
      Duration(seconds: 6),
      () {
        // here the will return the the value according to the duration
        return "Roman Ojha";
      },
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Hello"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text("$name"),
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text("Your Name"),
                  onPressed: getData,
                ),
              ),
            ],
          )),
    );
  }
}
