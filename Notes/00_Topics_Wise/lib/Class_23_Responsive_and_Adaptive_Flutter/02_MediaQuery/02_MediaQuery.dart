// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

/*
  -> MediaQuery can be using if you are building app for different screen sizes require different layouts
*/

class MediaQueryClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // If you want to get the data of devices then we can use 'MediaQuery'
    var deviceData = MediaQuery.of(context);
    // get screen size of device
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;

    // Device Orientation
    var deviceOrientation = MediaQuery.of(context).orientation;
    String deviceOrientationString = "";
    if (deviceOrientation == Orientation.landscape) {
      deviceOrientationString = "landscape";
    } else if (deviceOrientation == Orientation.portrait) {
      deviceOrientationString = "portrait";
    }

    // padding: if you want to check out the part of the screen are obscured by a system UI, much like a lower-level safe
    var notchInset = MediaQuery.of(context).padding;

    // get interesting accessibility information:
    // like whether the device is requesting you limit you animation
    var noAnimations = MediaQuery.of(context).disableAnimations;
    // or level of screen contract
    var screenContrast = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      appBar: AppBar(
        title: Text('MediaQueryClass'),
      ),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              // let us assume that you want to give the container width according to the size of the screen but this way is not recommend but sometime we have to use this method as well
              // like we can use 'Expanded', 'FractionallySizedBox', 'Flexible' widget to achieve that
              // but we will try to achieve this using mediaQuery
              width: MediaQuery.of(context).size.width * 0.2,
              // now here we are setting 20% of device width as this container width
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("$deviceOrientationString"),
            ),
          ]),
    );
  }
}
