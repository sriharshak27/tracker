// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}
class _DefaultPageState extends State<DefaultPage> {
  DocumentSnapshot? userDoc;

  @override
  void initState(){
    super.initState();
    retrieveDocument().then((document) {
      setState(() {
        userDoc = document;
      });
    });
  }

  Future<DocumentSnapshot> retrieveDocument() async {
    final col = FirebaseFirestore.instance.collection('users');
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final documentReference = col.doc(uid);
    return documentReference.get();
  }

  @override
  Widget build(BuildContext context) {
    int selInd = userDoc?['selected_index'] ?? 0;
    String workoutName = userDoc?['workouts'][selInd]['workout_name'] ?? '';
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade100,
      body: userDoc == null
        ? Center(child: CircularProgressIndicator(),)
        : SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.width*0.1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.width*0.8,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.shade700,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        workoutName,
                        // "PPL Split",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, fontSize: 30,
                          fontWeight: FontWeight.w200
                        ),
                      ),
                      Text('Push Day',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, fontSize: 30,
                          fontWeight: FontWeight.w300
                        ),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width*0.05,),
            Divider(
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.blue,
            ),
            SizedBox(height: MediaQuery.of(context).size.width*0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(12)
                  ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width*0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: GestureDetector (
                // onTap: , Save weight
                child: Container (
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.height*0.3,
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
                  child: Center(child: Text('Save Weight', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),),)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}