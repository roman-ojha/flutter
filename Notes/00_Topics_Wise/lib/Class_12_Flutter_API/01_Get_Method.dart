import 'package:flutter/material.dart';

// we will going to use 'http' package
// which will going to allow us to handel http request from thrid party API
// flutter pub add http
import 'package:http/http.dart';
import 'dart:convert';
// this allowed us to convert the to data that we can work with

import 'dart:math';

class FlutterAPIGet extends StatefulWidget {
  State<FlutterAPIGet> createState() => _FlutterAPIGetState();
}

class _FlutterAPIGetState extends State<FlutterAPIGet> {
  var rng = new Random();

  Map data = {"userId": "", "id": "", "title": "", "completed": false};
  void getData() async {
    Response response = await get(Uri.parse(
        'https://jsonplaceholder.typicode.com/todos/${rng.nextInt(100)}'));
    print(response.body);
    // here in 'response.body' we will get the string
    // so we have to convert into accessable formate so we have to import and use jsonDecode
    setState(() {
      data = jsonDecode(response.body);
      // now we aill going to get map
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter API"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "UserID: ${data['userId']}\nID: ${data['id']}\nTitle: ${data['title']}\n Completed: ${data['completed']}",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
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
