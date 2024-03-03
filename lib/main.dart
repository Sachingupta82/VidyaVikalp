// import 'dart:io';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:vidyavikalp/splashScreen/splashscreen.dart';

// Future<void> main() async {
//   runApp(vidyavikalp());
//   WidgetsFlutterBinding.ensureInitialized();
//   Platform.isAndroid
//       ? await Firebase.initializeApp(
//           options: const FirebaseOptions(
//               apiKey: "AIzaSyAuzI0aPfzCmIUS0KOPrXt6aQjo0xvE1Z8",
//               appId: "1:802972165840:android:899b1f83d4df942cf760d5",
//               messagingSenderId: "802972165840",
//               projectId: "vidyavikalp-8f130"),
//         )
//       : await Firebase.initializeApp();
// }
// class vidyavikalp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen.shade200,primary: Colors.lightGreen.shade300),
//       ),
//       home: StartSplash(),
//     );
//   }
  
// }



import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyavikalp/splashScreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool visitedSplash = prefs.getBool('visitedSplash') ?? false;

  if (visitedSplash) {
    runApp(Vidyavikalp()); // Run your main app if user has visited splash
  } else {
    runApp(StartSplash());
  }


  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAuzI0aPfzCmIUS0KOPrXt6aQjo0xvE1Z8",
              appId: "1:802972165840:android:899b1f83d4df942cf760d5",
              messagingSenderId: "802972165840",
              projectId: "vidyavikalp-8f130"),
        )
      : await Firebase.initializeApp();
}

class Vidyavikalp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen.shade200, primary: Colors.lightGreen.shade300),
      ),
      home: StartSplash(),
    );
  }
}

