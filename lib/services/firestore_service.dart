import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fetch learning modules
  Future<List<QueryDocumentSnapshot>> getLearningModules() async {
    QuerySnapshot snapshot = await _db.collection('learningModules').get();
    return snapshot.docs;
  }

  // Fetch quizzes by module ID
  Future<DocumentSnapshot> getQuizById(String quizId) async {
    return await _db.collection('quizzes').doc(quizId).get();
  }
}
