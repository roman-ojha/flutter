import 'package:flutter/material.dart';

class StackClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stack Class"),
        ),
        body: Container(
          child: Stack(
            // fit: StackFit.expand,
            // expand will fill the stack parent

            // alignment property will change the postion of the stack of non-Positioned and Partialy Positioned Stack Children

            // alignment: Alignment.bottomCenter, // apply for non-positioned or Partially positioned Stack Children
            alignment: AlignmentDirectional.center,
            clipBehavior: Clip.none,
            // to control the Clipping behaviour of the Stack children
            fit: StackFit.loose,
            children: <Widget>[
              Container(
                width: 250,
                height: 250,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              Container(
                width: 250,
                height: 250,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              Container(
                width: 210,
                height: 210,
                margin: EdgeInsets.all(30),
                color: Colors.orange,
              ),
              Container(
                width: 170,
                height: 170,
                margin: EdgeInsets.all(30),
                color: Colors.red,
              ),
              Positioned(
                // you can give the Position of the Child of the Stack
                bottom: -50,
                right: -50,
                height: 200,
                width: 200,
                child: Container(
                  width: 130,
                  height: 130,
                  margin: EdgeInsets.all(30),
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
