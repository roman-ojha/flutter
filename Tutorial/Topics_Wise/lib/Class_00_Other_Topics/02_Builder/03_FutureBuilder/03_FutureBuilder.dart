/*
  => When future is involve that we will use future builder to build the widget for the future 
  => When we want the data async and we know the data is comming in future then we will use future builder

  => The future must have been obtained earlier, e.g. during State.initState, State.didUpdateWidget, or State.didChangeDependencies. It must not be created during the State.build or StatelessWidget.build method call when constructing the FutureBuilder. If the future is created at the same time as the FutureBuilder, then every time the FutureBuilder's parent is rebuilt, the asynchronous task will be restarted.
*/

import 'package:flutter/material.dart';

class FutureBuilderClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  final Future<List> _getUsername = Future<List>.delayed(
    const Duration(seconds: 2),
    () => [
      {
        "name": "Roman Ojha",
      },
      {
        "name": "Mina Ojha",
      },
      {
        "name": "Razz Roman",
      },
      {
        "name": "Hello World",
      },
      {
        "name": "Harry bhai",
      },
      {
        "name": "Unique ID",
      },
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilderClass'),
      ),
      body: FutureBuilder<List>(
        future: _getUsername,
        // here we will get the future data
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            // this snapshot contain data that is comming from the future
            final nameList = snapshot.data;
            // getting value of the snapshot as the list
            return ListView.builder(
              // building the
              itemCount: nameList?.length,
              itemBuilder: (context, index) {
                final value = nameList![index]["name"];
                return ListTile(
                  title: Text("$value"),
                );
              },
            );
          } else if (snapshot.hasError) {
            // if we get the error
            return Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Sorry Server Error, Please try again letter...!!!",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            );
          } else {
            // this return value will show upto the we didnot get responde from the future
            return Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Awaiting result...",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
