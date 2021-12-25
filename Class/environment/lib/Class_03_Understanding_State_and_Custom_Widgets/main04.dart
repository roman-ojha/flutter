import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
// import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
// but here const is the compile time constant it means after assign some value to it, it can never change
  final List questions = const [
    // 'const List question' is the const variable which can't change
    // and 'const[]' List value is also the const where we are making to so that it will not change
    {
      "questionText": "What\'s you favriote color?",
      "answers": ["Black", "Red", "Green", "White"],
    },
    {
      "questionText": "What\'s your favorite animal?",
      "answers": ['Rabbit', 'Snake', 'Elephant', "lion"]
    },
    {
      "questionText": "Who\'s your favorite instructor?",
      "answers": ['Max', 'Max', 'Max', 'Max']
    },
  ];

  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
      print("We have more questions");
    } else {
      print("No move question!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < questions.length
            ? Column(
                // here we are using conditional operator to check if the user will exced the '_questionIndex'
                children: [
                  Question(questions[_questionIndex]["questionText"]),
                  ...(questions[_questionIndex]["answers"] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text("You Did it"),
              ),
      ),
    );
  }
}
