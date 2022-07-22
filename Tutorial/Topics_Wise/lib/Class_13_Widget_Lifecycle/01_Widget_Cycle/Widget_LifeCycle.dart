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
      -> called when object is removed from the tree
      -> when moving the widget in the widget tree using globalKey
      -> this is not dispose method
      -> do now dispose it here
    5) dispose
      -> called when object is removed from the tree permanently
      -> here you will write the dispose logic
      -> ex: when replacing this widget with another for example using Navigator.pushReplacement and
      -> 
    6) build
  # Widget Lifecycle on StateLess and StateFul Widget:
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
          b) build()
            -> Builds that widget tree
            -> A build is triggered every time we use setState()
          c) dispose()
            -> When the widget/state object is removed
          d) didChangeDependencies()
          e) didUpdateWidget() 
          f) deactivate()
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

  // 3. didUpdateWidget
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

  // 4. deactivate
  @override
  void deactivate() {
    print('deactivate');
    // super call is at the bottom of this method
    super.deactivate();
  }

  // 5. dispose
  @override
  void dispose() {
    print('dispose');
    // here we know that we had create the animation controller and this is the most important this to dispose
    _animationController.dispose();
    // if we will not dispose then we will have a memory leak in our application

    // super call is at the bottom of this method
    super.dispose();
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
            ),

            // Ex of 'dispose'
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => AfterDispose(),
                    ),
                  );
                },
                child: Text("Dispose"))
          ],
        ),
      ),
    );
  }
}

class AfterDispose extends StatelessWidget {
  const AfterDispose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AfterDispose'),
      ),
      body: Center(
        child: Container(
          child: Text("After Dispose"),
        ),
      ),
    );
  }
}
