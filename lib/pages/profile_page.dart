// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Colors.lightBlueAccent.shade200,
                  Colors.lightBlueAccent.shade700,
                ]
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
                  MediaQuery.of(context).size.width, 125)
              )
            ),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.lightBlueAccent,
                width: 3,
              ),
            ),
            child: Icon(
              Icons.person_rounded,
              size: 150,
              color: Colors.lightBlueAccent,
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(width: 10,),
                Icon(
                  Icons.email_outlined,
                  color: Colors.lightBlueAccent.shade700,
                  size: 35,
                ),
                // SizedBox(width: 40,),
                Text(
                  'abcdef@gmail.com',
                  style: TextStyle(
                    color: Colors.lightBlueAccent.shade700,
                    fontSize: 15
                  ),
                ),
              ],
            ),
          ),
          //change email
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: GestureDetector (
              // onTap: ,// MANAGE CHANGING EMAILS
              child: Container (
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.blueAccent.shade400, 
                    Colors.lightBlueAccent.shade400
                    ]
                  ),
                  // color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(child: Text('Change Email', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),),)
              ),
            ),
          ),
          SizedBox(height: 45,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: GestureDetector (
              // onTap: ,// MANAGE CHANGING EMAILS
              child: Container (
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.blueAccent.shade400, 
                    Colors.lightBlueAccent.shade400
                    ]
                  ),
                  // color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(child: Text('Reset Password', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),),)
              ),
            ),
          ),
          SizedBox(height: 45,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: GestureDetector (
              onTap: (() => FirebaseAuth.instance.signOut()),
              child: Container (
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.blueAccent.shade400, 
                    Colors.lightBlueAccent.shade400
                    ]
                  ),
                  // color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(child: Text('Sign Out', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),),)
              ),
            ),
          ),
        ],
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('logged in as ${user.email!}'),
      //       MaterialButton(
      //         onPressed: (() => FirebaseAuth.instance.signOut()),
      //         color: Colors.yellow,
      //         child: Text('sign out'),
      //       ),
      //     ],
      //   ),
      // )
    );
  }
}