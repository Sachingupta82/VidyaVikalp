//quiz page

import 'package:flutter/material.dart';
import 'package:vidyavikalp/components/navbar.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _totalQuestions = 3; // Update this with the total number of questions
  double _progress = 0.0;
  List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': ['Paris', 'London', 'Berlin', 'Madrid'],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'Who painted the Mona Lisa?',
      'answers': ['Leonardo da Vinci', 'Pablo Picasso', 'Vincent van Gogh', 'Claude Monet'],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'What is the longest river in the world??',
      'answers': ['Godavari', 'Narmada', 'Nile', 'Krishna'],
      'correctAnswerIndex': 2,
    },
    // Add more questions here
  ];
  bool _isCorrect = false;
  bool _quizCompleted = false;

  void _handleAnswer(int selectedAnswerIndex) {
    if (_quizCompleted) return; // Do nothing if the quiz is already completed

    if (selectedAnswerIndex == _questions[_currentQuestionIndex]['correctAnswerIndex']) {
      setState(() {
        _isCorrect = true;
        _progress = (_currentQuestionIndex + 1) / _totalQuestions;
      });
      _moveToNextQuestion();
    } else {
      setState(() {
        _isCorrect = false;
      });
      _showErrorDialog();
    }
  }

  void _moveToNextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % _totalQuestions;
      if (_currentQuestionIndex == 0) {
        // Quiz completed, show result
        _quizCompleted = true;
      }
      _isCorrect = false; // Reset correctness status
    });
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Incorrect Answer'),
          content: Text('Try again!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LinearProgressIndicator(
              value: _progress,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20.0),
            if (!_quizCompleted) // Show question and answers if quiz is not completed
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _questions[_currentQuestionIndex]['question'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    children: List.generate(
                      _questions[_currentQuestionIndex]['answers'].length,
                      (index) {
                        String answer = _questions[_currentQuestionIndex]['answers'][index];
                        return ElevatedButton(
                          onPressed: () {
                            _handleAnswer(index);
                          },
                          child: Text(answer),
                        );
                      },
                    ),
                  ),
                  if (_isCorrect)
                    Text(
                      'Correct!',
                      style: TextStyle(color: Colors.green, fontSize: 18.0),
                    ),
                ],
              ),
            if (_quizCompleted)
              Navbarpage(),
             // Show result message if quiz is completed
              // Text(
              //   'Quiz Completed! Your Score: ${(_progress * 100).toStringAsFixed(2)}%',
              //   style: TextStyle(fontSize: 18.0),
              // ),
          ],
        ),
      ),
    );
  }
}