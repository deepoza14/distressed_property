import 'package:distressed_property/screens/complete_screen.dart';
import 'package:distressed_property/screens/homepage.dart';
import 'package:distressed_property/screens/pending_screen.dart';
import 'package:distressed_property/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MainAppScreen extends StatefulWidget {
  @override
  _MainAppScreenState createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    PendingScreen(),
    CompleteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // Show all labels and icons
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/pending.png"),
            label: 'Pending',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/complete.png"),
            label: 'Complete',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
