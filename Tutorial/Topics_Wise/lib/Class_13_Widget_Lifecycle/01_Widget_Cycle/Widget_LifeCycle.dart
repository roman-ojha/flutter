/*
  # Different Type of lifecycle method on flutter
    1) initState
      -> First Lifecycle method that is called when the widget is created
      -> This is called before the build method
      -> here you can do any kind of initialization needed for the widget
    2) didChangeDependencies
      -> Second lifecycle method that is called
      -> this is called directly after initState
      -> Called every time a dependency change
      -> Ex: we can reassign variable for things like inherited widget. 
    3) didUpdateWidget
      -> Called whenever the widget configuration changes
      -> ex: passing variable down to constructor and those variable update/change
      -> ex: when you pass a duration for a animation controller
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

class FlutterLifeCycle extends StatefulWidget {
  @override
  State<FlutterLifeCycle> createState() => _FlutterLifeCycleState();
}

class _FlutterLifeCycleState extends State<FlutterLifeCycle> {
  // Example of 'didUpdateWidget':
  // we will create the method 'updateTitle' which will be responsible for updating our state variable
  String title = "FlutterLifeCycle";
  void updateTitle() {
    setState(() {
      title = "Roman";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: title,
        onPressed: updateTitle,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Ex of 'didUpdateWidget'
  final String title;
  final VoidCallback onPressed;
  const MyHomePage({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // for using animation controller we will use 'SingleTickerProviderStateMixin'

  // 1. initState:
  @override
  void initState() {
    // super call need to call first on this method
    super.initState();
    // Ex: Initialize the AnimationController
    _animationController = AnimationController(vsync: this);
    print('initState');
  }

  // 2. didChangeDependencies
  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    // read doc when to call super in this method
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    // super call need to call first in this method
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
    // now here we will get the reference of the new widget and old widget
    if (this.widget.title != oldWidget.title) {
      // it means that title had changed
      print("title changed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            // Ex of 'didUpdateWidget'
            ElevatedButton(
              onPressed: this.widget.onPressed,
              child: Text("ChangeTitle"),
            )
          ],
        ),
      ),
    );
  }
}
