import 'package:flutter/material.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  final List<String> _imagePaths = [
    "assets/Vocabulary/goodbye.png",
    "assets/Vocabulary/hello.png",
    "assets/Vocabulary/iloveyou.png",
    "assets/Vocabulary/no.png",
    "assets/Vocabulary/please.png",
    "assets/Vocabulary/sorry.png",
    "assets/Vocabulary/thankyou.png",
    "assets/Vocabulary/yes.png",
    "assets/Vocabulary/youarewelcome.png"
  ];
  final List<String> _vocHeading = [
    "Goodbye",
    "Hello",
    "Iloveyou",
    "No",
    "Please",
    "Sorry",
    "Thankyou",
    "Yes",
    "Youarewelcome"
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
      appBar: AppBar(),
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
            currentIndex: index.toString(),
          );
        },
      ),
    );
  }
}

class OnboardPage extends StatefulWidget {
  final String imagePath;

  final String currentIndex;
  OnboardPage({
    required this.imagePath,
    required this.currentIndex,
  });

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
          const SizedBox(height: 20.0),
          widget.currentIndex == "8"
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
