import 'package:flutter/material.dart';

class RoutePageFirstWay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
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
                // Pushing a rout directly, Without usin a name route
                Navigator.of(context).push(
                  // With MaterialPageRoute, you can pass data between pages,
                  // but if you have a more Complex app, you will quickly get lost.
                  MaterialPageRoute(
                    builder: (context) => SecondPage(
                      data: "This message for second page",
                    ),
                  ),
                );
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
