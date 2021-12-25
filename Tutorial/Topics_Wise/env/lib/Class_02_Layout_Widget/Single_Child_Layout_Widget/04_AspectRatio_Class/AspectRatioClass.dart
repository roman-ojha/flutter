import 'package:flutter/material.dart';

class AspectRatioClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Aspect Ratio"),
        ),
        body: Container(
          width: 200,
          child: AspectRatio(
            // aspectRatio: 1.5,
            aspectRatio: 3 / 2,
            // Aspect ratio is the ratio between the width and the height of a box
            // it will calculate the width/height of the child by its parent
            // it ofter wirtten as the fraction
            // NOTE: make sure the you let the AspectRation widget size it's Child
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
