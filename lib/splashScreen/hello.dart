
import 'package:flutter/material.dart';
import 'package:vidyavikalp/screens/questions.dart';
class Hello extends StatefulWidget {
  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Holla'),
      ),
      body: Column(
        children: [
          Center(
            child: Image(image: AssetImage('assets/hello.gif')),
            
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text('Welcome to Vidyavikalp Dive into a world of seamless experiences designed just for you. Let\'s get started on your journey',style: TextStyle(fontSize: 25),),
          ),
          SizedBox(height: 15),
        SizedBox(
          height: 50,
          width: 250,
          child: ElevatedButton(onPressed: (){
          Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => Quizpagefirst()));
                 
          }, 
          child: Text('Move ahead',style: TextStyle(fontWeight: FontWeight.bold, fontSize:20),)),
        )
  
        ],
      ),
      
    );
  }
}