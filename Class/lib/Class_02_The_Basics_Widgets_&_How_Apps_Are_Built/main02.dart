import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // here by only using 'text' weiget we can't be able to style the app
      // so we also have to style the app we want like background color etc..
      // so to do that we have a helper widget which we can use and that is 'Scaffold()'
      // Scaffold have job to create the base page design for app
      home: Scaffold(
        // 'Scaffold' also have a 'named' Argument
        // you can hit the 'ctrl+space' to see the list of named Argument that are avilabel
        // for example we can add the 'appBar:' or the 'body:'
        // 'body:' is the main content of the page
        // 'appBar:' is the bar at the top
        // 'appBar:' takes the prefered sized widget and for now we have 'AppBar()' widget from 'material.dart'
        // 'AppBar()' widget also take a lot of named argument here we can pass 'backgroundColor:' or 'actions:' or 'title:' etc
        appBar: AppBar(
          title: Text("My First App"),
          // 'title:' is the widget that allowed us to make a title for this page
          // and which takes the 'Text()' widget
        ),
        body: Text("This is my Default Text"),
        // body is also the another 'named' argument of the 'Scaffold' widget
        // Note that body only takes one widget
      ),
    );
  }
}
