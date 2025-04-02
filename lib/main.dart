// lib/main.dart
import 'package:drive_prep/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart'; // Update the import

void main() {
  runApp(const DrivePrepApp());
}

class DrivePrepApp extends StatelessWidget {
  const DrivePrepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DrivePrep',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const WelcomeScreen(), // Set WelcomeScreen as the initial screen
    );
  }
}