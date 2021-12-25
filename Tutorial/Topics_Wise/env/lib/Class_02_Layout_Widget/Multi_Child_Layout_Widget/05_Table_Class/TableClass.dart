import 'package:flutter/material.dart';

class TableClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Table Class"),
        ),
        body: Table(
          /*-------------------Table Class----------------------*/
          // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          // defaultVerticalAlignment: TableCellVerticalAlignment.top,
          defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
          // to Align the table row Widget
          // defaultColumnWidth: FlexColumnWidth(1.0), //default
          defaultColumnWidth: FractionColumnWidth(0.30),
          // NOTE: note that Table Row must have the same number of children
          columnWidths: {1: FractionColumnWidth(.2)},
          // columnWidths: const <int, TableColumnWidth>{
          //   0: IntrinsicColumnWidth(),
          //   1: FlexColumnWidth(),
          //   2: FixedColumnWidth(64),
          // },
          // we can set the Column width for the Spacific column as well
          border: TableBorder.all(width: 4, color: Colors.black),
          textDirection: TextDirection.rtl,
          // to change the diraction of the children
          children: [
            TableRow(
              /*-------Table Row------------*/
              children: [
                Container(
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
                Container(
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
                Container(
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              children: [
                Container(
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
                Container(
                  child: Text(
                    "5",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
                Container(
                  child: Text(
                    "6",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                children: [
                  Container(
                    child: Text(
                      "7",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 120,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
