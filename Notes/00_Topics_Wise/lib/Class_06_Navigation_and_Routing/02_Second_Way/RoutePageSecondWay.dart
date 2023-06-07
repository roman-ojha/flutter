import 'package:flutter/material.dart';

class RoutePageSecondWay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
      routes: {
        // by using routes it is not possible to pass the dynamic data from the one page to another
        // so this is also not the best approch to navigate to the pages
        '/second': (_) => SecondPage(
              data: "abc",
            ),
      },
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
                Navigator.of(context).pushNamed('/second');
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
