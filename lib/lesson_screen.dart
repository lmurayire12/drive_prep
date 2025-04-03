// lib/screens/lesson_screen.dart
import 'package:flutter/material.dart';
import 'package:drive_prep/home_screen.dart';

class LessonScreen extends StatefulWidget {
  final String title;
  final List<String> lessons;

  const LessonScreen({super.key, required this.title, required this.lessons});

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int _currentLessonIndex = 0;

  void _nextLesson() {
    if (_currentLessonIndex < widget.lessons.length - 1) {
      setState(() {
        _currentLessonIndex++;
      });
    }
  }

  void _previousLesson() {
    if (_currentLessonIndex > 0) {
      setState(() {
        _currentLessonIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final lesson =
        widget.lessons.isNotEmpty
            ? widget.lessons[_currentLessonIndex]
            : 'No Lessons Available';
    final imagePath =
        lesson == 'Introduction to Driving'
            ? 'assets/traffic_light.jpg'
            : 'assets/VF.jpg';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5D5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5D5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.title, style: const TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                lesson,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (lesson == 'Introduction to Driving') ...[
                        const Text(
                          'What You’ll Learn:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          '• Understanding the responsibilities of a driver.\n'
                          '• Road safety awareness and the importance of defensive driving.\n'
                          '• Overview of traffic laws and regulations.',
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Why It’s Important:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Every driver must understand their role in ensuring safety for themselves, passengers, and others on the road.',
                        ),
                      ] else if (lesson ==
                          'Vehicle Familiarization & Controls') ...[
                        const Text(
                          'What You’ll Learn:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          '• Identifying key car components (steering wheel, pedals, gear shift, dashboard indicators).\n'
                          '• Adjusting mirrors, seat position, and seatbelt use.\n'
                          '• How to start and stop a vehicle properly.',
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Why It’s Important:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Knowing your vehicle helps improve control and confidence while driving.',
                        ),
                      ],
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          imagePath,
                          // height: 200,
                          // width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _currentLessonIndex > 0 ? _previousLesson : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed:
                        _currentLessonIndex < widget.lessons.length - 1
                            ? _nextLesson
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
} //lesson_screen dart
