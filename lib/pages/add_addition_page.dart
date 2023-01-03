// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout/classes/addition.dart';
import 'package:workout/classes/exercise.dart';

import '../classes/date_proc.dart';
import '../classes/day_cycle.dart';
import '../classes/workout.dart';

class AddExercise extends StatefulWidget {
  final int workoutIndex;
  const AddExercise({super.key, required this.workoutIndex});

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  final _dayName = TextEditingController();
  final _month = TextEditingController();
  final _day = TextEditingController();
  final _year = TextEditingController();
  final _ename = TextEditingController();
  final _sets = TextEditingController();
  final _reps = TextEditingController();
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
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlue,),
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
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 10,),
                    Text(
                      'Manage Workout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w200,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 75,),
          
                //
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
                      controller: _dayName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Day Name (ex. Push)',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10,),
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
                      controller: _month,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Month',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10,),
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
                      controller: _day,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Day',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10,),
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
                      controller: _year,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Year',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10,),
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
                      controller: _ename,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Exercise Name',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      controller: _sets,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Sets',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
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
                      controller: _reps,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Reps',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10,),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector (
                    onTap: (){
                      Exercise e = Exercise.inputs(name: _ename.text.trim());
                      ExerciseAddition ea = ExerciseAddition.inputs(
                        exercise: e, reps: int.parse(_reps.text.trim()), sets: int.parse(_sets.text.trim())
                      );
                      String inpDate = '${_month.text.trim()}/${_day.text.trim()}/${_year.text.trim()}';

                      final col = FirebaseFirestore.instance.collection('users');
                      final uid = FirebaseAuth.instance.currentUser?.uid;
                      var tmp = userDoc?.data() as Map<String, dynamic>;

                      if (userDoc!['workouts'][widget.workoutIndex].containsKey(inpDate)) {
                        tmp['workouts'][widget.workoutIndex][inpDate]['exercises'].add(ea.toJson());
                        col.doc(uid).set(tmp);
                      }
                      else{
                        WorkoutDay wd = WorkoutDay.inputs(name: _dayName.text.trim());
                        wd.addExercise(ea);
                        tmp['workouts'][widget.workoutIndex][inpDate] = {
                          'exercises': [ea.toJson()]
                        };
                        col.doc(uid).set(tmp);
                      }

                      // _ename.clear();
                      // _sets.clear();
                      // _reps.clear();
                    },
                    child: Container (
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(
                        child: Text(
                          'Add Exercise',
                          style: TextStyle (
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                      ),)
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector (
                    onTap: (){
                      final col = FirebaseFirestore.instance.collection('users');
                      final uid = FirebaseAuth.instance.currentUser?.uid;
                      col.doc(uid).update({
                        'selected_index': widget.workoutIndex
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
                          'Make Default',
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
      ),
    );
  }
}