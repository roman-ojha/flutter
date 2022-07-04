import 'package:flutter/material.dart';

// here we can import the another widget from the file like this
import './question.dart';
// now we can use custorm 'question.dart' widget file in this file

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // so here we don't wan't other file to use "MyAppState" class so we will going to use '_MyAppState' to make it private
  // so now you have to put all of the method and property in private if you don't want it to use by other file
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      // 'setState' will update the state by calling the 'build()' method again
      // but flutter will rerender those changes that happen
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s you favriot color?',
      "What\'s your favorite animal?"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          // we can also make another dart file for the widget and import it in here
          children: [
            Question(questions[_questionIndex]),
            // now here 'Question()' is the constructor of class Question that we made in another file 'question.dart'
            ElevatedButton(
              child: Text("Answer 1"),
              onPressed: _answerQuestion,
            ),
            ElevatedButton(
              child: Text("Answer 2"),
              onPressed: () => print("Answer 2 Chosen!"),
            ),
            ElevatedButton(
              child: Text("Answer 3"),
              onPressed: () => print("Answer 3 Chosen!"),
            ),
          ],
        ),
      ),
    );
  }
}
