import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  // final List<Map<String, Object>> questions;
  final List questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {required this.answerQuestion,
      required this.questions,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      // here we are using conditional operator to check if the user will exced the '_questionIndex'
      children: [
        Question(questions[questionIndex]["questionText"]),
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
          // now here in 'answerQuestion()' we can pass the score number
        }).toList()
      ],
    );
  }
}
