import 'package:flutter/material.dart';
import 'package:env/Class_06_Navigation_and_Routing/04_Map_&_Routing/First_Routing_Page.dart';
import 'package:env/Class_06_Navigation_and_Routing/04_Map_&_Routing/Second_Routing_Page.dart';
import 'package:env/Class_06_Navigation_and_Routing/04_Map_&_Routing/Third_Routing_Page.dart';

class MainRoutingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: FirstPage(),
      // in MaterialApp we have routes named parameter where we will use map
      initialRoute: '/second',
      // intitial Route will going to start the app with that route whcih we had given
      routes: {
        // the value in this route are going to be function
        // these funciton take an context object as argument
        // now this function return the Widget that we want to loadup when we go to the spacific route
        // for home page :
        '/': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
