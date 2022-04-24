import 'package:flutter/material.dart';

class MyChildWidget extends StatefulWidget {
  final String text;
  final customFunction;
  // here this 'customFunction' will be pass as the parameter to the constructor which can be able to access by the parent widget
  const MyChildWidget({Key? key, required this.text, this.customFunction})
      : super(key: key);
  // here we had give the property 'text' for the MyChildWidget

  _MyChildExampleState createState() => _MyChildExampleState();
}

class _MyChildExampleState extends State<MyChildWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // here 'widget.text' we are getting the data from the parent widget to the child widget
          Text(widget.text),
          ElevatedButton(
            child: Text("Click me"),
            onPressed: () {
              widget.customFunction(widget.text);
              // here we are passing the string as an argumment to the 'customFunction' which is again pass to the 'MyChildWidget' constructor and from that constructor 'customFunction' function is avilable to the parent widget and it means that the given data from the 'customFunction' is now avilable ot he parent widget
            },
          )
        ],
      ),
    );
  }
}
