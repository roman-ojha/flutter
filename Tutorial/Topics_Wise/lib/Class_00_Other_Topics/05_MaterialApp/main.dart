import 'package:flutter/material.dart';

/*
  -> A convenience widget that wraps a number of widgets that are commonly required for material design applications.
  ->  It builds upon a WidgetsApp by adding material-design specific functionality, such as AnimatedTheme and GridPaper.
*/

class MaterialAppClass extends StatelessWidget {
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
        title: Text('MaterialAppClass'),
      ),
      body: Container(),
    );
  }
}
