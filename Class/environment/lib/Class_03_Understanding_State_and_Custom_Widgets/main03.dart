import 'package:flutter/material.dart';

// here we can import the another widget from the file like this
import './question.dart';
// now we can use custorm 'question.dart' widget file in this file

import './answer.dart';

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
    List questions = [
      {
        "questionText": "What\'s you favriot color?",
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
    // so to show the questio and answer we use map
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]["questionText"]),
            // here we are accessing the map 'questionText'
            ...(questions[_questionIndex]["answers"] as List<String>)
                .map((answer) {
              // here we have to use '...' spred operator because we want to add the 'Answer' widget in the 'children' named argument List
              // and they pull all the value from the list out of the list add them at the sorrounding of the list as the individual value

              // now rather then calling the 'Answer' widget again and again we will going to use map
              // but we only want the answer List in this case we will make the map of that answer list
              // and returing the weiget using map
              // and also map doesn't change the original question list rather it generat the new list best on the old list and perform the action
              return Answer(_answerQuestion, answer);
              // now we can use the 'Answer()' Widget which is button
              // as we are passing the '_answerQuestion' in constructor as parameter because we need that in the 'Answer()' Widget
            }).toList()
          ],
        ),
      ),
    );
  }
}
