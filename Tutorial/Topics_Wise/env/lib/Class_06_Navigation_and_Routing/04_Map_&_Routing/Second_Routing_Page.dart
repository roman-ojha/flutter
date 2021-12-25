import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Second Page"),
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
            ),
            ElevatedButton(
              child: Text("Third Page"),
              onPressed: () {
                // Navigator.pushNamed(context, '/third');
                Navigator.pushReplacementNamed(context, '/third');
              },
            )
          ],
        ),
      ),
    );
  }
}
