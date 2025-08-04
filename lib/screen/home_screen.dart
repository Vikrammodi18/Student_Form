import 'package:flutter/material.dart';
import 'package:student_entry_app/features/student/student_form.dart';
import 'package:student_entry_app/features/student/student_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // List of screens to display
  final List<Widget> _screens = [
    StudentForm(),
    StudentList(),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update index
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Student Form',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Student List',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
