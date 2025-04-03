import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  

  Future<User?> register(
    String email,
    String password,
    String fullName,
    String phone,
  ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      if (user != null) {
        // Send verification email to the user 
        await user.sendEmailVerification();

        // Store user details in Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'email': email,
          'fullName': fullName,
          'phone': phone,
          'isAdmin': false,
          'joinedAt': Timestamp.now(),
          'subscriptionStatus': 'Free',
          'profilePicture': '',
          'badges': [],
          'progress': {'completedLessons': '0', 'quizzesPassed': '0'},
        });

        return user;
      }
    } catch (e) {
      print("Registration Error: $e");
      return null;
    }
    return null;
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }
} //auth_service.dart
