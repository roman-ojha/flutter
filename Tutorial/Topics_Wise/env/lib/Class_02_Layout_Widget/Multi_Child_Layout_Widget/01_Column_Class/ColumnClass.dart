import 'package:flutter/material.dart';

/*
A widget that displays its children in a vertical array.
To cause a child to expand to fill the available vertical space, wrap the child in an Expanded widget.
The Column widget does not scroll (and in general it is considered an error to have more children in a Column than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a ListView.
*/

class ColumnClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ColumnClass")),
        body: Column(
          children: <Widget>[
            const Text("First Text", style: TextStyle(fontSize: 40)),
            const Text("Second Text", style: TextStyle(fontSize: 40)),
            const Text("Third Text", style: TextStyle(fontSize: 40)),
            const Text("Fourth Text", style: TextStyle(fontSize: 40)),
            const Text("Firth Text", style: TextStyle(fontSize: 40)),
            const Text("Fifth Text", style: TextStyle(fontSize: 40)),
            // Expanded(
            //   child: FittedBox(
            //     fit: BoxFit.contain, // otherwise the logo will be tiny
            //     child: FlutterLogo(),
            //   ),
            // ),
          ],
          verticalDirection: VerticalDirection
              .up, // this will change the direction of the childrent in the Column
          // crossAxisAlignment: CrossAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          // this will align the children
          textDirection: TextDirection.rtl,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          textBaseline: TextBaseline.ideographic,
        ),
      ),
    );
  }
}
