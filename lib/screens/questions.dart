// import 'package:flutter/material.dart';
// import 'package:sensors_plus/sensors_plus.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:vidyavikalp/components/navbar.dart';


// class Quizpagefirst extends StatefulWidget {
//   @override
//   _QuizpagefirstState createState() => _QuizpagefirstState();
// }

// class _QuizpagefirstState extends State<Quizpagefirst> {
//   int _currentQuestionIndex = 0;
//   FlutterTts flutterTts = FlutterTts();

//   List<Map<String, dynamic>> _questions = [
//     {
//       'question': 'What language will you prefer?',
//       'answers': ['English', 'Hindi', 'Marathi'],
//     },
//     {
//       'question': 'App is used by who?',
//       'answers': ['Myself', 'Parents', 'Teachers', 'others'],
//     },
//     {
//       'question': 'What is the type of disability?',
//       'answers': ['Mute', 'Deaf', 'Blind', 'other'],
//     },
//   ];

//   void _handleAnswer(String answer) {
//     // Move to the next question
//     if (_currentQuestionIndex < _questions.length - 1) {
//       setState(() {
//         _currentQuestionIndex++;
//       });
//     } else {
//       // Quiz completed, navigate to the appropriate screen based on the answer
//       _navigateToScreen(answer);
//     }
//   }

//   void _navigateToScreen(String answer) {
//     switch (answer.toLowerCase()) {
//       case 'mute':
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => Navbarpage()),
//         );
//         break;
//       case 'deaf':
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => Navbarpage()),
//         );
//         break;
//       case 'blind':
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => Navbarpage()),
//         );
//         break;
//       default:
//         // Handle other cases if needed
//         break;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Subscribe to the accelerometer events for shake detection
//     accelerometerEvents.listen((event) {
//       if (event.x.abs() > 12 || event.y.abs() > 12 || event.z.abs() > 12) {
//         // If the phone is shaken, read out the current question
//         _speak(_questions[_currentQuestionIndex]['question']);
//       }
//     });
//   }

//   Future<void> _speak(String text) async {
//     await flutterTts.setLanguage('en-US');
//     await flutterTts.speak(text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Short Quiz'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Text(
//               _questions[_currentQuestionIndex]['question'],
//               style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Column(
//               children: List.generate(
//                 _questions[_currentQuestionIndex]['answers'].length,
//                 (index) {
//                   String answer = _questions[_currentQuestionIndex]['answers'][index];
//                   return ElevatedButton(
//                     onPressed: () {
//                       _handleAnswer(answer);
//                     },
//                     child: Text(answer),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:vidyavikalp/components/navbar.dart';

class Quizpagefirst extends StatefulWidget {
  @override
  _QuizpagefirstState createState() => _QuizpagefirstState();
}

class _QuizpagefirstState extends State<Quizpagefirst> {
  int _currentQuestionIndex = 0;
  FlutterTts flutterTts = FlutterTts();
  final databaseReference = FirebaseDatabase.instance.reference();

  bool isMute = false;
  bool isDeaf = false;
  bool isBlind = false;

  List<Map<String, dynamic>> _questions = [
    {
      'question': 'What language will you prefer?',
      'answers': ['English', 'Hindi', 'Marathi'],
    },
    {
      'question': 'App is used by who?',
      'answers': ['Myself', 'Parents', 'Teachers', 'others'],
    },
    {
      'question': 'What is the type of disability?',
      'answers': ['Mute', 'Deaf', 'Blind', 'other'],
    },
  ];

  void _handleAnswer(String answer) {
    // Move to the next question
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
      if (_currentQuestionIndex == 2) {
        // Set the disability flags based on the answer
        isMute = answer.toLowerCase() == 'mute';
        isDeaf = answer.toLowerCase() == 'deaf';
        isBlind = answer.toLowerCase() == 'blind';
      }
    } else {
      // Quiz completed, navigate to the appropriate screen based on the answer
      _navigateToScreen(answer);
    }
  }

  void _navigateToScreen(String answer) {
    switch (answer.toLowerCase()) {
      case 'mute':
        _updateDatabase();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Navbarpage()),
        );
        break;
      case 'deaf':
        _updateDatabase();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Navbarpage()),
        );
        break;
      case 'blind':
        _updateDatabase();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Navbarpage()),
        );
        break;
      default:
        // Handle other cases if needed
        break;
    }
  }

  void _updateDatabase() {
    databaseReference.child('disability').set({
      'isMute': isMute,
      'isDeaf': isDeaf,
      'isBlind': isBlind,
    });
  }

  @override
  void initState() {
    super.initState();
    // Subscribe to the accelerometer events for shake detection
    accelerometerEvents.listen((event) {
      if (event.x.abs() > 12 || event.y.abs() > 12 || event.z.abs() > 12) {
        // If the phone is shaken, read out the current question
        _speak(_questions[_currentQuestionIndex]['question']);
      }
    });
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Short Quiz'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
                      _handleAnswer(answer);
                    },
                    child: Text(answer),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
