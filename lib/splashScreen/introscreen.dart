
import 'package:flutter/material.dart';
import 'package:vidyavikalp/screens/Login_page.dart';
import 'package:vidyavikalp/splashScreen/hello.dart';
class OnboardScreen extends StatefulWidget {
  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  final List<String> _imagePaths = [
    'assets/mute.png',
    'assets/deeaf.png',
    'assets/blind.png',
  ];

  final List<String> _descriptions = [
    "A group of diverse individuals communicating using sign language, emphasizing inclusivity and alternative forms of communication for those with speaking disabilities.",
    "A group of diverse individuals using sign language to communicate, with hands gesturing various signs and expressions, reflecting the rich and expressive nature of sign language as a primary mode of communication for deaf individuals.",
    "An illustration of a person using a white cane while navigating their surroundings, symbolizing independence and mobility for blind individuals. The person's posture and expression could convey confidence and determination.",
  ];

  int _currentPageIndex = 0;

  void nextPage() {
    if (_currentPageIndex < _imagePaths.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }
  }

  void previousPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _imagePaths.length,
        onPageChanged: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnboardPage(
            imagePath: _imagePaths[index],
            description: _descriptions[index],
          );
        },
      ),
      
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        
        children: <Widget>[
          
          if (_currentPageIndex < _imagePaths.length - 1)
            FloatingActionButton(
              heroTag: 1,
              onPressed: nextPage,
              child: Icon(Icons.navigate_next),
            )
             else if (_currentPageIndex > 0)
           
          if (_currentPageIndex == _imagePaths.length - 1)
            FloatingActionButton(
              heroTag: 3,
              onPressed: nextPage,
              child: Text('Next'),
            ),
          SizedBox(width: 10),
         
        ],
      ),
    );
  }
}

class OnboardPage extends StatelessWidget {
  final String imagePath;
  final String description;

  OnboardPage({required this.imagePath, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 200, // Adjust width as needed
            height: 200, // Adjust height as needed
          ),
          SizedBox(height: 20.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}

// class NextScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Next Screen'),
//       ),
//       body: Center(
//         child: Text('This is the next screen.'),
//       ),
//     );
//   }
// }
