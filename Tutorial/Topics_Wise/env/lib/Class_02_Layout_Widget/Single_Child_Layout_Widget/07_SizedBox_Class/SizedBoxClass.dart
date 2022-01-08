import 'package:flutter/material.dart';

class SizedBoxClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("SizedBox Class"),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              /*----------SizedBox Class-------------*/
              height: 100,
              width: 100,
              // to Sized the Child we can use SizedBox Widget
              // SizedBox is the widget with the Spacific Size that directs its child to also have the same size
              child: ElevatedButton(
                child: Text("Button"),
                onPressed: null,
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
              //  we can use the SizedBox to Add gat to the Widget as well
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Button"),
                onPressed: null,
              ),
            ),
            SizedBox.expand(
              // expand function will expand the size of widget upto screen
              child: Container(
                alignment: Alignment.center,
                child: Text("Hello"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
