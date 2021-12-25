import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = "Your are awase and innocent!";
    } else if (resultScore <= 12) {
      resultText = "Preety likeable!";
    } else if (resultScore <= 16) {
      resultText = "You are ... Strange?!";
    } else {
      resultText = "You are so bad!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Text(
        resultPhrase,
        // here we are using get method to assing the score text
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      TextButton(
        child: Text("Restart Quiz!",
            style: TextStyle(color: Colors.deepPurpleAccent)),
        onPressed: resetHandler,
      )
    ]));
  }
}
