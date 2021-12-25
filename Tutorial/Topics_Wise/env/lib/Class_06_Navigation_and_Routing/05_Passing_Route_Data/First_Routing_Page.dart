import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Map data = {
    "name": "Roman OJha",
    "id": 13,
    "gender": "Male",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Second page"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/second',
                    arguments: data);
                // here by using argument we can pass the data which navigating to the another screen
              },
            )
          ],
        ),
      ),
    );
  }
}
