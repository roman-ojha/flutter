import 'package:flutter/material.dart';

class FlutterCustomClipperWidget extends StatefulWidget {
  const FlutterCustomClipperWidget({Key? key}) : super(key: key);

  @override
  _FlutterCustomClipperWidgetState createState() =>
      _FlutterCustomClipperWidgetState();
}

class _FlutterCustomClipperWidgetState
    extends State<FlutterCustomClipperWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Wave Clipper Design"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
            child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: ClipPath(
                // we are using clip path because we want to us a custom cliper
                child: Container(
                  color: Colors.deepOrangeAccent,
                  height: 200,
                ),
                clipper: WaveClipper(),
              ),
            ),
            ClipPath(
              // we are using clip path because we want to us a custom cliper
              child: Container(
                color: Colors.red,
                height: 180,
                alignment: Alignment.center,
                child: Text(
                  "Wave Clipper",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
              clipper: WaveClipper(),
            ),
          ],
        )),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    // here height is comming from the 'Container' Widget
    // start path with this if you are making
    var firstStart = Offset(size.width / 5, size.height);
    //First point of quadratic bezier curve
    // here we are setting the width and the height of the first point start point after that upto that height and widht it will curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    // here we are setting the widtha and the height of the first end point where it is ending
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    // a quadratic bezier curve is a bezier curve of degree 2 and is define through 3 point most of the time (p0,p1,p2)
    // p0 and p2 are the end point and p1 is the controlled point and curve tends to go to the p1

    // save for the second point
    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
