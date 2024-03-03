import 'package:flutter/material.dart';

class AlphabetPg1 extends StatefulWidget {
  const AlphabetPg1({super.key});

  @override
  State<AlphabetPg1> createState() => _AlphabetPg1State();
}

class _AlphabetPg1State extends State<AlphabetPg1> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  final List<String> _imagePaths = [
    "assets/alphabets/1.png",
    "assets/alphabets/2.png",
    "assets/alphabets/3.png",
    "assets/alphabets/4.png",
    "assets/alphabets/5.png",
    "assets/alphabets/6.png",
    "assets/alphabets/7.png",
    "assets/alphabets/8.png",
    "assets/alphabets/9.png",
    "assets/alphabets/10.png",
    "assets/alphabets/11.png",
    "assets/alphabets/12.png",
    "assets/alphabets/13.png",
    "assets/alphabets/14.png",
    "assets/alphabets/15.png",
    "assets/alphabets/16.png",
    "assets/alphabets/17.png",
    "assets/alphabets/18.png",
    "assets/alphabets/19.png",
    "assets/alphabets/20.png",
    "assets/alphabets/21.png",
    "assets/alphabets/22.png",
    "assets/alphabets/23.png",
    "assets/alphabets/24.png",
    "assets/alphabets/25.png",
    "assets/alphabets/26.png"
  ];
  final List<String> _alphabetsList = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
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
          widget.currentIndex == "25"
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
