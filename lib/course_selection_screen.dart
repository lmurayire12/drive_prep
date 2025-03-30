import 'package:flutter/material.dart';
import 'lesson_screen.dart';
import 'package:drive_prep/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseSelectionScreen extends StatefulWidget {
  const CourseSelectionScreen({super.key});

  @override
  _CourseSelectionScreenState createState() => _CourseSelectionScreenState();
}

class _CourseSelectionScreenState extends State<CourseSelectionScreen> {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5D5),
      appBar: AppBar(
        title: const Text('Our Courses', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFF5F5D5),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: FutureBuilder<List<QueryDocumentSnapshot>>(
        future: _firestoreService.getLearningModules(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No modules found.'));
          }

          final modules = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: modules.length,
            itemBuilder: (context, index) {
              var module = modules[index].data() as Map<String, dynamic>;

              return GestureDetector(
                onTap: () async {
                  final quizId = module['quizID'];
                  await _firestoreService.getQuizById(quizId);

                  if (!context.mounted) return;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => LessonScreen(
                            title: module['title'] ?? 'Lesson',
                            lessons: [module['content'] ?? 'No content'],
                          ),
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: Colors.green, width: 2),
                  ),
                  child: ListTile(
                    title: Text(
                      module['title'] ?? 'Untitled Course',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(module['description']),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
