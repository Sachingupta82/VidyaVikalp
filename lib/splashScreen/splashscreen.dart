// import 'dart:async';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:vidyavikalp/splashScreen/introscreen.dart';
// // import 'package:users/assistant/assistant_method.dart';
// // import 'package:users/global/global.dart';
// // import 'package:users/screens/first_page.dart';
// // import 'package:users/screens/login_Page.dart';
// // import 'package:users/screens/navigation_bar.dart';

// class StartSplash extends StatefulWidget {
//   const StartSplash({super.key});

//   @override
//   State<StartSplash> createState() => _StartSplashState();
// }

// class _StartSplashState extends State<StartSplash> {
//   setTimer(){
//     Timer(const Duration(seconds: 5),() async{
//       // if(await firebaseAuth.currentUser != null){
//       //   firebaseAuth.currentUser != null? AssistantMethods.readCurrentOnlineUserInfo():null;
//       //   Navigator.push(context,MaterialPageRoute(builder: (c)=> Navbarpage()));
//       // }
//       // else{
//       //   Navigator.push(context,MaterialPageRoute(builder:(c)=> Login()));
//       // }
//      Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => OnboardScreen()),
//      );
//     } );
//   }

//   @override
//   void initState(){
//     super.initState();
//     setTimer();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(child: Text("Hello"),),
//     );
//   }
// }



import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyavikalp/splashScreen/introscreen.dart';

class StartSplash extends StatefulWidget {
  const StartSplash({Key? key}) : super(key: key);

  @override
  State<StartSplash> createState() => _StartSplashState();
}

class _StartSplashState extends State<StartSplash> {
  setTimer(BuildContext context) {
    Timer(const Duration(seconds: 5), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool visitedSplash = prefs.getBool('visitedSplash') ?? false;

      if (visitedSplash) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardScreen()),
        );
      } else {
        prefs.setBool('visitedSplash', true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardScreen()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
