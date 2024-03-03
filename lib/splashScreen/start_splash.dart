import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyavikalp/assistant/assistant_method.dart';
import 'package:vidyavikalp/screens/Login_page.dart';
import 'package:vidyavikalp/screens/global.dart';
import 'package:vidyavikalp/screens/signup_Page.dart';

// class StartSplash extends StatefulWidget {
//   const StartSplash({super.key});

//   @override
//   State<StartSplash> createState() => _StartSplashState();
// }

// class _StartSplashState extends State<StartSplash> {
//   setTimer(){
//     Timer(const Duration(seconds: 5),() async{
//       if(await firebaseAuth.currentUser != null){
//         firebaseAuth.currentUser != null? AssistantMethods.readCurrentOnlineUserInfo():null;
//         Navigator.push(context,MaterialPageRoute(builder: (c)=> SignUp()));
//       }
//       else{
//         Navigator.push(context,MaterialPageRoute(builder:(c)=> Login()));
//       }
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
//       body: Center(child: Image.asset('images/splashlogo.gif'),),
//     );
//   }
// }

class StartSplash extends StatefulWidget {
  @override
  _StartSplashState createState() => _StartSplashState();
}

class _StartSplashState extends State<StartSplash> {
  setTimer() {
    Timer(const Duration(seconds: 5), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('hasVisitedSplash', true);

      if (firebaseAuth.currentUser != null) {
        firebaseAuth.currentUser != null
            ? AssistantMethods.readCurrentOnlineUserInfo()
            : null;
        Navigator.push(context, MaterialPageRoute(builder: (c) => SignUp()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (c) => Login()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/splashlogo.gif'),
      ),
    );
  }
}