/*
  => sometimes our design need the sized of widget which need to be relative no fixed or 'px' if we need the widget of size in percentage then we can use 'FractionallySizedBox'
  
*/

import 'package:flutter/material.dart';

class FractionallySizeboxClass extends StatelessWidget {
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
        title: Text('FractionallySizeboxClass'),
      ),
      body: SizedBox.expand(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          heightFactor: 0.4,
          // 1 => 100% , 0 => 0%
          alignment: FractionalOffset.center,
          child: Container(
            height: 100.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Text(
              "Hello",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
