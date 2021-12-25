import 'package:environment/Chapter_02_Git_&_Dart_Data_Types_&_Scaffold/home_page.dart';
import 'package:flutter/material.dart';

/*
  -> 'r' to refrace
  -> 'Shift+r' to build projcet again

  -> FVM (flutter Version Management) (https://fvm.app/)
    -> you can use this as well for the flutter

  # Git
    -> git init (inside this project)
*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // here rather then using home in here we will going to put this in another folder
    // by creating the file home_page.dart and classname HomePage();
    // now we can use HomePage() in home: HomePage()
    return MaterialApp(
      home: HomePage(),
    );
  }
}
