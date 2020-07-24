import "package:flutter/material.dart";
import 'package:quiz_app/drawerMenu.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

//data in this class is persistence. _ makes it private
class _QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  // Map can be created with Map() or {}
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 5},
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 4}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Tiger', 'score': 6},
        {'text': 'Dog', 'score': 4},
        {'text': 'Cat', 'score': 10},
      ]
    },
    {
      'questionText': 'What\'s your favorite meal?',
      'answers': [
        {'text': 'Burger', 'score': 2},
        {'text': 'Sandwich', 'score': 9},
        {'text': 'Kepab', 'score': 1},
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    //force flutter to rerender widget -> build() is called again
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print(_questionIndex);
    }
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          drawer: DrawerMenu(),
          appBar: AppBar(
            title: Text("Quiz App"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  answerHandler: _answerQuestion,
                  questionIndex: _questionIndex)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
