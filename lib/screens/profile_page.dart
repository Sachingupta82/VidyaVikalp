import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vidyavikalp/screens/Login_page.dart';
import 'package:vidyavikalp/screens/global.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name="";
  String phone="";
  String email="";
  Future<void> retrieveUserData() async {
  String userId = currentUser!.uid; // Assuming currentUser is globally accessible

  // Reference to the user node in the database
  DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users").child(userId);

  // Fetch the data
  DataSnapshot dataSnapshot = (await userRef.once()) as DataSnapshot;

  // Extract the user data from the snapshot
  Map<dynamic, dynamic>? userData = dataSnapshot.value as Map<dynamic, dynamic>?;

  // Now you can access the user data fields
   name = userData?["name"];
   email = userData?["email"];
   phone = userData?["phone"];

  print("Name: $name");
  print("Email: $email");
  print("Phone: $phone");
}

  @override
  void initState() {
    super.initState();
    retrieveUserData();
  }
  void _logout() async {
  await firebaseAuth.signOut();
  currentUser = null; // Reset the current user
  Fluttertoast.showToast(msg: "Successfully Logged Out");
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => Login(), // Navigate back to login page after logout
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                      onPressed: () {
                        _logout();
                      },
                      icon: const Icon(Icons.exit_to_app,color: Colors.white,),
                      label: Text('Logout',style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade400, // Use red for the button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Optional: Round the corners
                        ),
                      ),
                    ),
              ),
      ]),
            SizedBox(height: 50),
            Center(
              child: CircleAvatar(
                        radius: 52,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(''),
                        ),
                      ),
            ),
            SizedBox(height: 30),

            Row(
              children: [
                SizedBox(width:25 ),
                Text("Name:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(width:20),
                Text("Sachin Gupta",style: TextStyle(fontSize: 22),),
              ],
            ),

            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(width:25 ),
                Text("Email:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(width:20),
                Text("sachin.apwig@gmail.com",style: TextStyle(fontSize: 18),),
              ],
            ),

             SizedBox(height: 25),
            Row(
              children: [
                SizedBox(width:25 ),
                Text("Phone:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(width:20),
                Text("8291407855",style: TextStyle(fontSize: 22),),
              ],
            ),

            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(width:25 ),
                Text("Address:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(width:20),
                Text("(Edit)",style: TextStyle(fontSize: 22),),
                GestureDetector(
                  onTap: () =>  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enter Address"),
          content: TextField(),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    ),
                  child: Icon(Icons.edit),
                ),
              ],
            ),

            SizedBox(height: 35),
            // Center(
            //   child: RatingBar.builder(
            //     initialRating: 3,
            //     minRating: 1,
            //     direction: Axis.horizontal,
            //     allowHalfRating: true,
            //     itemCount: 5,
            //     itemSize: 50,
            //     itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            //     itemBuilder: (context, _) => Icon(
            //       Icons.star,
            //       color: Colors.amber,
            //     ),
            //     onRatingUpdate: (rating) {
            //       print(rating);
            //     },
            //   ),
            // ),


          ],
        ),
      ),
    );
  }
}