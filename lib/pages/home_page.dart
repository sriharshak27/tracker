// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:workout/pages/default_page.dart';
import 'package:workout/pages/profile_page.dart';
// import 'package:workout/pages/progress_page.dart';
import 'package:workout/pages/workout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    DefaultPage(),
    WorkoutPage(),
    // ProgressPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.lightBlue,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.lightBlue.shade700,
            gap: 8,
            padding: EdgeInsets.all(16),
            onTabChange: ((index) => _navigateBar(index)),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home'
              ),
              GButton(
                icon: Icons.fitness_center,
                text: 'Manage Plans'
              ),
              // GButton(
              //   icon: Icons.show_chart,
              //   text: 'Progress'
              // ),
              GButton(
                icon: Icons.person,
                text: 'Profile'
              )
            ]
          ),
        ),
      ),
    );
  }
}