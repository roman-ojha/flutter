import 'package:flutter/material.dart';

class ConstrainedBoxClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("ConstrainedBox Class"),
      ),
      body: Center(
        child: Column(
          children: [
            ConstrainedBox(
              // using ConstrainedBox we can Limit the Size of the Child
              constraints: BoxConstraints(
                maxHeight: 100,
                maxWidth: 200,
                minHeight: 20,
                minWidth: 20,
              ),
              child: Text("Hellofdsaasdfsafsadfdsafasfasf"),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 100,
                maxWidth: 300,
                minWidth: 100,
              ),
              child: Container(
                width: 150,
                // here The maxWidth of the ConstrainedBox is 300 so we can put the width of Container/Child upto 300
                // an also for Height
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: ElevatedButton(
                  child: Text("button"),
                  onPressed: null,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
