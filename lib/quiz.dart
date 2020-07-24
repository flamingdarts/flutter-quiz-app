import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerHandler;

  Quiz(
      {@required this.questions,
      @required this.answerHandler,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['questionText']),
        //... spread operator: take a list and pull all elements out and add as individual value to a list
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerHandler(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
