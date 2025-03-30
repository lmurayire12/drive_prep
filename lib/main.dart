import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:drive_prep/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // Explicitly use this configuration only for web
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAU9Xfm-o8i51cR1c66weBhONdGbpvf8bQ",
          authDomain: "drivepep-45037.firebaseapp.com",
          projectId: "drivepep-45037",
          storageBucket: "drivepep-45037.firebasestorage.app",
          messagingSenderId: "819304464552",
          appId: "1:819304464552:web:d0d6b3a1d1e4de5fef029d",
          measurementId: "G-7TEJ7NM3TT"),
    );
  } else {
    // Android and iOS initialization (uses google-services.json or GoogleService-Info.plist)
    await Firebase.initializeApp();
  }

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
      home: const WelcomeScreen(),
    );
  }
}
