import 'package:flutter/material.dart';
import 'package:fyp/ui/camera_screen.dart';
import 'package:fyp/ui/contact_screen.dart';
import 'package:fyp/ui/home_main_screen.dart';
import 'package:fyp/ui/profile_screen.dart';
import 'package:fyp/ui/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // To track the current active tab

  final List<Widget> _children = [
    const HomeMainScreen(),
    const ContactScreen(),
    const CameraScreen(),
    const SettingScreen(),
    const ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index; // Update the index when tapped
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed const from Scaffold because _children[_currentIndex] is dynamic.
      body: _children[_currentIndex], // Display the currently selected screen.

      // Bottom navigation bar to switch between tabs.
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // Handle tab changes.
        currentIndex: _currentIndex, // Set the active tab.
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Contact',
            backgroundColor: Color(0xff0F0F1A)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
