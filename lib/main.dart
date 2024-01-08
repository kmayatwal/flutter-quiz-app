// import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('My First App'),
//         ),
//         body: Text('This is my default text!'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw MyAppState();
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var questions = const [
    {
      'questionText': 'What\' your favorite Color?',
      'answer': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What\' your favorite animal?',
      'answer': ['Rabbit', 'Snake', 'Lion', 'Elephant']
    },
    {
      'questionText': 'Who\' your favorite Instructor?',
      'answer': ['FreeCodeCamp', 'Leet Code', 'Hacker Rank', 'Self']
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'] as String,
                  ),
                  ...(questions[_questionIndex]['answer'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }),
                ],
              )
            : Center(
                child: Text('You did it!'),
              ),
      ),
    );
  }
}
