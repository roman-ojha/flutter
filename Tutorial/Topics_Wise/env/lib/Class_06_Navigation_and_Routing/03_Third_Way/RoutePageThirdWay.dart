import 'package:env/Class_06_Navigation_and_Routing/03_Third_Way/ThirdWayRouteGenerator.dart';
import 'package:flutter/material.dart';

class RoutePageThirdWay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
      initialRoute: '/',
      // this is the initialRoute and the first page that open
      onGenerateRoute: RouteGenerator.generateRoute,
      // we can generate route inside this function as well but we will create the another class in another file to create that
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routing App"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "First Page",
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
              child: Text("Go to second"),
              onPressed: () {
                Navigator.of(context).pushNamed('/second',
                    arguments: "Hello there from the first page!");
                // here we don't have to specify the Class/Widget/Page name we can eaisly be able to use route name
              },
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  // this is a String for the sake of an example
  // You can use andy type you want.
  final String data;

  SecondPage({var key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routing App"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'Second Page',
            style: TextStyle(fontSize: 50),
          ),
          Text(
            data,
            style: TextStyle(fontSize: 20),
          )
        ],
      )),
    );
  }
}
