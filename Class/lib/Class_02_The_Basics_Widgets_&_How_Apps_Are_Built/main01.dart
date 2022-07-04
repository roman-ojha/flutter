import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  // here run app is the funciton provided by the 'material.dart'
  // which runs our flutter app
  // where we pass the 'MyApp()' because we are passing the constructor it will create the object
  // and that called the 'build()' function
}

// void main()=>runApp(MyApp());
// to run app we can also do this

// to create a wiget we have to create a class
class MyApp extends StatelessWidget {
  // here we have to inherit from the another class so that we can use those feature
  // so to do that we have to import package from the other file
  // in this case we are importing the material.dart so,
  // we have to import package from flutter/material.dart

  // material.dart have a lot of widget which we can use in the project
  // material also work on iso
  // an metiral.dart also have a base class that allowed you to create you own widget called 'StatelessWidget'

  // so now we have to add the method came from base class called 'build()'
  // using this 'build()' we will build the app
  // here @override is 'decorater'
  @override
  Widget build(BuildContext context) {
    // 'BuildContext' is the class which is define in material.dart
    // 'context' is the object that we have to pass
    //  which tolds us about the meta information about the app and widegt we are building
    // now in this function we are building the widget so, we have to return the 'Widget'
    // 'Widget' is also the class

    // now we are returning the wedget
    // there is a spical weidget that we have to return and that is 'MaterialApp()'
    return MaterialApp(
      home: Text("Hello!"),
    );
    // 'MaterialApp()' is the wiget that is in material.dart which is provided by the flutter
    // which is the base setup to turn combination of wigets on the real app that is render
    // 'MaterialApp()' takes a lot of 'named' argument
    // here right now we callde the 'home:' argument

    // 'home:' is the core widget that flutter will bring onto the screen when this app is mount to the screen
    // here in 'home:' we could use a Text() widget which is again came from 'material.dart'
    // 'Text' is the class and we are calling the Constructor of the class where we are passing the 'text' as the argument
  }
}
