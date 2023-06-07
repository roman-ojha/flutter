import 'package:flutter/material.dart';

class PositionedClass extends StatelessWidget {
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
        title: Text('PositionedClass'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.pink,
        child: Stack(children: <Widget>[
          Positioned(
            // this widget will position the child where ever we want it to be
            top: 100,
            width: 200,
            left: 100,
            child: Container(
              // width: 300,
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.blue,
              ),
              child: Text(
                "Hello",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
