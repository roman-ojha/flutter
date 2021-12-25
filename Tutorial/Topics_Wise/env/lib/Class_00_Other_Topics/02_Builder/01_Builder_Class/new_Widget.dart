import 'package:flutter/material.dart';

class NewWidget extends StatefulWidget {
  @override
  _NewWidgetState createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    // now this widget doesn't need the builder method to access the 'Scaffold' widget because it has the context in it and now it can access the parent widget easily
    return ElevatedButton(
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          // now here we can access the 'Scaffold' from the widget tree and create the SnackBar in the scaffold using the builder
          content: Text("Hello world"),
        ));
      },
      child: Text("Show SnackBar"),
    );
  }
}
