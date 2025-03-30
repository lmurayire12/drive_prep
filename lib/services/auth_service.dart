import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // signIn method
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

  Future<User?> register(
      String email, String password, String fullName, String phone) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;

      // Save full user data clearly matching your Firestore structure
      await _firestore.collection('users').doc(user!.uid).set({
        'email': email,
        'fullName': fullName,
        'phone': phone,
        'joinedAt': Timestamp.now(),
        'subscriptionStatus': 'Free',
        'profilePicture': '', // empty initially
        'badges': [],
        'progress': {
          'completedLessons': '0',
          'quizzesPassed': '0',
        },
      });

      return user;
    } catch (e) {
      print("Registration Error: $e");
      return null;
    }
  }
}
