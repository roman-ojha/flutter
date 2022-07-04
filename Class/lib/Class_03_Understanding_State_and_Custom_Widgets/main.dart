import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
// but here const is the compile time constant it means after assign some value to it, it can never change
  final List _questions = const [
    // 'const List question' is the const variable which can't change
    // and 'const[]' List value is also the const where we are making to so that it will not change
    {
      "questionText": "What\'s you favriote color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 6},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1}
      ],
    },
    {
      "questionText": "What\'s your favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 3},
        {"text": "Snake", "score": 11},
        {"text": "Elephant", "score": 5},
        {"text": "lion", "score": 9}
      ]
    },
    {
      "questionText": "Who\'s your favorite instructor?",
      "answers": [
        {"text": 'Max', "score": 1},
        {"text": 'Max', "score": 1},
        {"text": 'Max', "score": 1},
        {"text": 'Max', "score": 1}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  // here after pressing 'Restart Quize!' button this function will going to call
  void _resultQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _totalScore += score;
      // here we are also changing the state of score
    });
    print("$_questionIndex $_totalScore");
    if (_questionIndex < _questions.length) {
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
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              // so in this 'Quiz()' widget we have to pass the '_answerQuestion' and '_questionIndex' and '_questions' because we need that in 'quiz.dart'
              : Result(_totalScore, _resultQuiz)),
    );
  }
}
