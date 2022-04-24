import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    // this supre.initState() is saying run the original function which we are overriding
    print("First Page Widget started.... Using intiState");
  }

  void incCounter() {
    setState(() {
      counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("First Page Widget started.... Inside the Build function");
    // this build Function will also run when the widget will call
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Second Page"),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            Text(
              "$counter",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              child: Text("Counter"),
              onPressed: incCounter,
            )
          ],
        ),
      ),
    );
  }
}
