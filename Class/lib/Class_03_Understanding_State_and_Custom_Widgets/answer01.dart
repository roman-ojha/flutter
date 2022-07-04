import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final selectHandler;
  final String answerText;
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
