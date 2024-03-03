
import 'package:flutter/material.dart';
import 'package:vidyavikalp/screens/chap2/alphabet_pg1.dart';
import 'package:vidyavikalp/screens/chap2/number_pg.dart';

class AlphabetScreen extends StatelessWidget {
  const AlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alphabet"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Handle onTap for the first container (Alphabet)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlphabetPg1(),
                ),
              );
            },
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Alphabet",
                  style: TextStyle(
                    fontSize: 50 * 0.5,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              // Handle onTap for the second container (Numbers)
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NumberPg(),
                  ));
            },
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Numbers",
                  style: TextStyle(
                    fontSize: 50 * 0.5,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
