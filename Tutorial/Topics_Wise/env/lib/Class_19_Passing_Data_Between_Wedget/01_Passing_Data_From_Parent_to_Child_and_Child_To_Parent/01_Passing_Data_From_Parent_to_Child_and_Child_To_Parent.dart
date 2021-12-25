import 'package:flutter/material.dart';
import 'myChildWidget.dart';

class PassingData extends StatelessWidget {
  const PassingData({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // here we can see that 'MyHomePage' have a constructor
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // here we are trying to send the message from 'myChildWidget' to the parent widget
  // so for that when we will press the button of the child widget the text of the 'parentString' has to change
  String parentString = 'parent String';

  void parentChange(newString) {
    // so int he child widget 'myChildWidget' we are passing this function
    // now we have pass the 'parentChange' function to the 'myChildWidget' it means that now 'parentChange' function can be access by the child widget
    setState(() {
      // so here when we will press the button from the child widget this 'parentChange' function will executed and the 'newString' will assign to the 'parentString' and becuase of that it will change the value of the 'parentString'
      // or we can say that we get the value 'newString' from the child widget
      parentString = newString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              parentString,
              style: TextStyle(fontSize: 28),
            ),
            MyChildWidget(
              // here we have created the child widget and we have pass the value or the text from parent to the child throught the constructor or as the argumment
              text: "Passing",
              // to pass the data from child to parent we will pass the cutom function
              customFunction: parentChange,
            )
          ],
        ),
      ),
    );
  }
}
