// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../classes/workout.dart';

class AddWorkout extends StatefulWidget {
  const AddWorkout({super.key});

  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [Colors.lightBlueAccent, Colors.lightBlue]
          )
        ),
        child: SafeArea (
          child: SingleChildScrollView(
            child: Column(
              children: [
                //logo
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 10,),
                    Text(
                      'Add Workout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w200,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 75,),
                SizedBox(height: 50),
          
                //email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,//Colors.grey[100],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30,),
                //signin
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector (
                    onTap: (){
                      final col = FirebaseFirestore.instance.collection('users');
                      final uid = FirebaseAuth.instance.currentUser?.uid;
                      col.doc(uid).update({
                        'workouts': FieldValue.arrayUnion([Workout.input(name: _nameController.text.trim()).toJson()])
                      });
                      Navigator.pop(context);
                    },
                    child: Container (
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(
                        child: Text(
                          'Create Plan',
                          style: TextStyle (
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                      ),)
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      )
    );
  }
}