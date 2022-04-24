import 'package:flutter/material.dart';

/*
=> GridView constructor:
  1) GridView
  2) GridView.count
  3) GridView.extent
  4) GridView.builder
  5) GridView.custom
*/

class GridViewClassCountConstructor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridView Class Count Constructor"),
        ),
        body: GridView.count(
          // Gridview using the count constructor
          // in Grid you can scroll throughg an items
          crossAxisCount: 4,
          // 'crossAxisCount' will use to determine how may grid item in a row or accross the grid
          mainAxisSpacing: 10.0,
          // mainAsicSpacing will give the horizental space between the row
          crossAxisSpacing: 10.0,
          // crossAxissSpacing will give the vertical space between the column
          reverse: true,
          // to reverse the whole grid child
          // scrollDirection: Axis.horizontal,
          scrollDirection: Axis.vertical,
          // to change the scrollDirection to horizontal or vertical
          addAutomaticKeepAlives: false,
          // if you want to allow the items to be garbase colleted when off-screen
          cacheExtent: 100.0,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.cyan),
              child: Text(
                "1",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.brown),
              child: Text(
                "2",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.orange),
              child: Text(
                "3",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "4",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                "5",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                "6",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.red),
              child: Text(
                "7",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.cyan),
              child: Text(
                "8",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.brown),
              child: Text(
                "9",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.orange),
              child: Text(
                "10",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "11",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                "12",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                "13",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.red),
              child: Text(
                "14",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.cyan),
              child: Text(
                "15",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.brown),
              child: Text(
                "16",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.orange),
              child: Text(
                "17",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "18",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                "19",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                "20",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.red),
              child: Text(
                "21",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.cyan),
              child: Text(
                "22",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.brown),
              child: Text(
                "23",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.orange),
              child: Text(
                "24",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "25",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.orange),
              child: Text(
                "26",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "27",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                "28",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                "29",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.red),
              child: Text(
                "39",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.cyan),
              child: Text(
                "31",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.brown),
              child: Text(
                "32",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
