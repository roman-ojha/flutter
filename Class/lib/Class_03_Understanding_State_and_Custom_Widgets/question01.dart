import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // here to get the data form the 'main.dart' file
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      // we are wrapping the 'Text()' widget in 'Container()' widget
      // and after that we can make the container as the block to take whole widht by just making it 'double.infinity'
      width: double.infinity,
      // margin: EdgeInsets.only() // only() for the only to the top only to the buttom etc..
      margin: EdgeInsets.all(10),
      // EdgeInsets.all() is the spacial constructor

      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
        // here "Text()" widget also take the another named argument called widget to Style the text
        // and here 'TextStyle()' take and named argument to Style the text
        // 'TextAlign.center' will center the Text because wrap the Text inside the 'Container' Widget
      ),
    );
  }
}
