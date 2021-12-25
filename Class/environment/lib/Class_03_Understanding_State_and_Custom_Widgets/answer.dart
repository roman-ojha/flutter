import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final selectHandler;
  final answerText;
  // here the final is like constant but it will work as the constant after the file get compiled before that we can be able to chage the value of it
  // as we are change in this example as well but when after the render heppen after that the value of final can't change
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        // color: Colors.blue[100], // color named parameter didnot work for ElevateButton widget
        child: Text(
          answerText,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: selectHandler,
      ),
    );
  }
}
