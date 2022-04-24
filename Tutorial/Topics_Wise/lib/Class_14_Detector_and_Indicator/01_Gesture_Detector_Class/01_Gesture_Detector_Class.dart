import 'package:flutter/material.dart';

class GestureDetectorClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gesture Detector"),
        ),
        body: ListView(
          children: [
            // GestureDetector-----------------------
            GestureDetector(
              // onTap: () {
              //   // the the child of the "GestureDetector" Tap
              //   print("Single Tap");
              // },
              onDoubleTap: () {
                print("Double Tap");
              },
              onDoubleTapDown: (p) {
                // A pointer that might cause a double tap has contacted the screen at a particular location
                // form this we can get the position that where we double tap
                // print("DoubleTap on ${h.localPosition}");
                print("DoubleTap on ${p.globalPosition}");
              },
              onDoubleTapCancel: () {
                // The pointer that previously triggered onDoubleTapDown will not end up causing a double tap.
                print("Double tap Cancel");
              },
              onForcePressStart: (p) {
                // The pointer is in contact with the screen and has pressed with sufficient force to initiate a force press. The amount of force is at least ForcePressGestureRecognizer.startPressure.
                print("ForcePressStart ${p.globalPosition}");
                print("ForcePressStart ${p.pressure}");
              },
              onForcePressPeak: (p) {
                // The pointer is in contact with the screen and has pressed with the maximum force. The amount of force is at least ForcePressGestureRecognizer.peakPressure.
                print("ForcePressStart ${p.globalPosition}");
                print("ForcePressStart ${p.pressure}");
              },
              onForcePressEnd: (p) {
                // The pointer is no longer in contact with the screen.
                print("ForcePressEnd ${p.pressure}");
              },
              onForcePressUpdate: (p) {
                // A pointer is in contact with the screen, has previously passed the ForcePressGestureRecognizer.startPressure and is either moving on the plane of the screen, pressing the screen with varying forces or both simultaneously
              },
              onLongPress: () {
                print("Long Press");
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 50,
                ),
                alignment: Alignment.center,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text("Click me👍"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
