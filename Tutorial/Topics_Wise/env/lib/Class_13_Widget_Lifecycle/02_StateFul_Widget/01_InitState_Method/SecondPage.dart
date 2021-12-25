import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
    // this supre.initState() is saying run the original function which we are overriding
    print("Second Page Widget started.... Using intiState");
  }

  @override
  Widget build(BuildContext context) {
    print("Second Page Widget started.... Inside the Build function");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              ElevatedButton(
                child: Text("First Page"),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
