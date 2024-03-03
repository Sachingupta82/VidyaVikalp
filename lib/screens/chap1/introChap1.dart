import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IntroChap1 extends StatefulWidget {
  const IntroChap1({super.key});

  @override
  State<IntroChap1> createState() => _IntroChap1State();
}

class _IntroChap1State extends State<IntroChap1> {
  //Pager for swipes
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  bool _understood = false; // Track if the user has understood

  final List<String> _imagePaths = [
    'assets/Chap1_img1.png',
    'assets/Chap1_img2.png',
    'assets/Chap1_img3.png',
  ];

  final List<String> _descriptions = [
    "Welcome to the fascinating world of hand sign language! Whether you're just starting your journey or looking to enhance your skills, this guide will provide you with a solid foundation in understanding and using hand signs effectively.",
    "Hand sign language, also known as sign language, is a visual and gestural language used primarily by deaf and hard-of-hearing individuals for communication. It is a rich and complex system of communication that involves the use of hand movements, facial expressions, and body language to convey meaning.",
    "Learning hand sign language opens up a world of communication and connection with deaf and hard-of-hearing individuals. It promotes inclusivity, empathy, and understanding, allowing for meaningful interactions across linguistic and cultural barriers. Additionally, learning sign language can enhance cognitive abilities and provide valuable skills for various professions, such as interpreting, teaching, and healthcare.",
  ];

  final List<String> _questions = [
    "Introduction..",
    "What is Hand Sign Language?",
    "Why Learn Hand Sign Language?",
  ];

  void nextPage() {
    if (_currentPageIndex < _imagePaths.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Introduction to Hand Signs"),
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
            question: _questions[index],
            currentIndex: index.toString(),
          );
        },
      ),
    );
  }
}

class OnboardPage extends StatefulWidget {
  final String imagePath;
  final String description;
  final String question;
  final String currentIndex;
  OnboardPage(
      {required this.imagePath,
      required this.description,
      required this.question,
      required this.currentIndex});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  bool _understood = false;
  void setUnderstood(bool bool) {
    setState(() {
      _understood = true;
    });
    print(_understood);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            widget.imagePath,
            width: 300, // Adjust width as needed
            height: 300, // Adjust height as needed
          ),
          const SizedBox(height: 10.0),
          Text(
            widget.question,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          widget.currentIndex == "2"
              ? ElevatedButton(
                  onPressed: () {
                    setUnderstood(true);
                  },
                  child: const Text("Understood"),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
