import 'package:flutter/material.dart';

class FormClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Form Class")),
        body: Column(
          children: <Widget>[
            Form(
              child: Text("Username"),
              onChanged: null,
            )
          ],
        ),
      ),
    ));
  }
}
