// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout/pages/add_workout_page.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
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
      body: SafeArea(
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
                      Text('Current Plan:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, fontSize: 36,
                          fontWeight: FontWeight.w200
                        ),),
                      
                      Text(workoutName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, fontSize: 36,
                          fontWeight: FontWeight.w200
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
                  child: ListView.builder(
                    itemCount: userDoc?['workouts'].length??0,
                    itemBuilder: (context, index) {
                      if (index == selInd) return Container();
                      return GestureDetector(
                        onTap: () {
                          final col = FirebaseFirestore.instance.collection('users');
                          final uid = FirebaseAuth.instance.currentUser?.uid;
                          col.doc(uid).update({
                            'selected_index': index
                          });
                          retrieveDocument().then((document) {
                            setState(() {
                              userDoc = document;
                            });
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent.shade400,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(userDoc?['workouts'][index]['workout_name'] ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                      // return Text(userDoc?['workouts'][index]['workout_name'] ?? '');
                    },
                  ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width*0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: GestureDetector (
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddWorkout(),
                    ),
                  );
                },
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
                  child: Center(child: Text('Add Workout', style: TextStyle(
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