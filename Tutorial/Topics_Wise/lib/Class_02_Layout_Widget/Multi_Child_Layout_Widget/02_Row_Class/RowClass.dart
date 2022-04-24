import 'package:flutter/material.dart';

/*
A widget that displays its children in a horizontal array.

To cause a child to expand to fill the available horizontal space, wrap the child in an Expanded widget.

The Row widget does not scroll (and in general it is considered an error to have more children in a Row than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a ListView.
*/

class RowClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("RowClass"),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            // Recommanded to use Expanded class inside the "Row" or "Column"
            children: <Widget>[
              const Text("First Text", style: TextStyle(fontSize: 30)),
              const Text("Second Text", style: TextStyle(fontSize: 30)),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 4),
          ),
          width: 350,
          height: 100,
        ),
      ),
    );
  }
}
