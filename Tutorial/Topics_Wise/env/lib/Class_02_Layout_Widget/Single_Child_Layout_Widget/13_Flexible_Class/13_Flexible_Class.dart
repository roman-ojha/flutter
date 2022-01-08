/*
  => if we want to size relative to the parent widget and if we want to adjust the size of widget if the parent widget size got changed the we will use flexible widget
*/

import 'package:flutter/material.dart';

class FlexibleClass extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('FlexibleClass'),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            // flex will determine how much we want to give sized to the flexible widget
            // takes sized upto 2/column(parent), 1/3 (2 Flex/ 6 Total)
            fit: FlexFit.tight,
            // we can spacify how strictness size should be
            // here we had use height: 30 but beucause of using 'fit:FlexFit.tight' now 'Conainer' will get the height upto it's available space which is calculated and take size upto 1/3 size and ignore the hegiht value of the 'Container'
            child: Container(
              width: double.infinity,
              height: 30,
              child: Text("Child 01"),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Flexible(
            flex: 3,
            // takes sized upto 3/column(parent)
            fit: FlexFit.loose,
            // here because of 'fit: FlexFit.loose' now firstly it will consider the value of Child widget size
            child: Container(
              width: double.infinity,
              height: 100,
              child: Text("Child 01"),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepOrange,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Flexible(
            flex: 1,
            // takes sized upto 1/column(parent)
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Text("Child 01"),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurple,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
