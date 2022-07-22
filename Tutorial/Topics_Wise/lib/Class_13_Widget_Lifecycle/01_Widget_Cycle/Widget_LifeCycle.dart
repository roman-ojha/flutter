/*
  # Different Type of lifecycle method on flutter
    1) initState
      -> First Lifecycle method that is called when the widget is created
      -> This is called before the build method
      -> here you can do any kind of initialization needed for the widget
    2) didChangeDependencies
    3) didUpdateWidget
    4) deactivate
    5) dispose
    6) build
  # Widget Lifecycle:
    1) Stateless
      => State does not Change over time
      => Build Function only runs once
    2) Stateful
      => State Can be change over time
      => setState() triggers the build function
      => StateFul widget also have couple of different life cycle methods that we can tap into:
          a) initState()
            -> Called only once when the widget is created
            -> Subscribe to streams or any object that could change our widget data
          b) Build()
            -> Builds that widget tree
            -> A build is triggered every time we use setState()
          c) Dispose()
            -> When the widget/state object is removed
*/

import 'package:flutter/material.dart';

class FlutterLifeCycle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterLifeCycle',
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
        title: Text('FlutterLifeCycle'),
      ),
      body: Container(),
    );
  }
}
