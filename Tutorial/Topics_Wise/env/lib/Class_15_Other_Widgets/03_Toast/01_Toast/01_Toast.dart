/*
  -> flutter pub add fluttertoast
*/

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast01 extends StatefulWidget {
  const Toast01({Key? key}) : super(key: key);

  @override
  _Toast01State createState() => _Toast01State();
}

class _Toast01State extends State<Toast01> {
  late FToast fToast;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Toast 01"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Show Toast 01"),
                onPressed: () => Fluttertoast.showToast(
                  msg: "Hello",
                  // toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.black,
                  fontSize: 20.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
