import 'package:flutter/material.dart';
import "UserWidget.dart";
import 'UserClass.dart';

class FlutterClasses extends StatelessWidget {
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
  var userA = UserA("Roman", "Ojha", 01);
  var userB = UserB(userID: 02, fName: "Razz", lastName: "Roman");
  var userC = UserC(firstName: "Mark", lastName: "pat", userID: 03);
  // create a data set 'userA', 'userB', 'userC' instance while contain the specific user Data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterClasses'),
      ),
      body: ListView(children: [
        // Rendering User Data through Widget
        ShowUser(
          firstName: userA.firstName,
          lastName: userA.lastName,
          userID: userA.userID,
        ),
        ShowUser(
          firstName: userB.firstName!,
          lastName: userB.lastName!,
          userID: userB.userID,
        ),
        ShowUser(
          firstName: userC.firstName,
          lastName: userC.lastName,
          userID: userC.userID,
        ),
      ]),
    );
  }
}
