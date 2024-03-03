import 'package:flutter/material.dart';

class NumberPg extends StatefulWidget {
  const NumberPg({super.key});

  @override
  State<NumberPg> createState() => _NumberPgState();
}

class _NumberPgState extends State<NumberPg> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  final List<String> _imagePaths = [
    "assets/Numbers/0.png",
    "assets/Numbers/1.png",
    "assets/Numbers/2.png",
    "assets/Numbers/3.png",
    "assets/Numbers/4.png",
    "assets/Numbers/5.png",
    "assets/Numbers/6.png",
    "assets/Numbers/7.png",
    "assets/Numbers/8.png",
    "assets/Numbers/9.png"
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
  OnboardPage({required this.imagePath, required this.currentIndex});

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
          widget.currentIndex == "9"
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
