
import 'package:flutter/material.dart';
import 'package:vidyavikalp/components/chap_tile.dart';
import 'package:vidyavikalp/screens/chap1/VocabularyScreen.dart';
import 'package:vidyavikalp/screens/chap1/alphabetScreen.dart';
import 'package:vidyavikalp/screens/chap1/introChap1.dart';

class ChapScreen extends StatefulWidget {
  const ChapScreen({super.key});

  @override
  State<ChapScreen> createState() => _ChapScreenState();
}

class _ChapScreenState extends State<ChapScreen> {
  var demoChapNames = [
    "Introduction to Hand Signs",
    "Alphabet and Numbers",
    "Basic Vocabulary"
  ];
  void onChapPressed(String chapName) {
    print(chapName);
    // You can add conditional logic here to determine which screen to navigate to
    if (chapName == "Introduction to Hand Signs") {
      print("vedant");

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const IntroChap1(),
      ));
    } else if (chapName == "Alphabet and Numbers") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AlphabetScreen(),
        ),
      );
    } else if (chapName == "Basic Vocabulary") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VocabularyScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chapters"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          //For list of chapters
          Expanded(
            child: ListView.builder(
                itemCount: demoChapNames.length,
                itemBuilder: (BuildContext context, int index) {
                  var chapNum = index + 1;
                  return ChapTile(
                    chapNum: chapNum,
                    chapName: demoChapNames[index],
                    onChapPressed: () => onChapPressed(demoChapNames[index]),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
