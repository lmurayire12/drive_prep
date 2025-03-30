// lib/screens/quiz_screen.dart
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  final List<int?> _selectedAnswers = [
    null,
    null,
    null,
  ]; // Track selected answers for each question

  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. What is the primary responsibility of a driver?',
      'options': [
        'a) Reaching their destination as quickly as possible',
        'b) Ensuring safety for themselves, passengers, and others on the road',
        'c) Driving fast to keep up with traffic',
        'd) Ignoring traffic signals if no one is watching',
      ],
      'correctAnswer': 1, // Index of the correct answer (b)
    },
    {
      'question': '2. What is defensive driving?',
      'options': [
        'a) Driving aggressively to keep others away',
        'b) Reacting quickly to road rage incidents',
        'c) Anticipating potential hazards and avoiding accidents',
        'd) Ignoring other drivers on the road',
      ],
      'correctAnswer': 2, // Index of the correct answer (c)
    },
    {
      'question': '3. What is the correct hand position on the steering wheel?',
      'options': [
        'a) 12 o\'clock position only',
        'b) 10 and 2 o\'clock or 9 and 3 o\'clock',
        'c) 6 o\'clock position only',
        'd) One hand on the wheel, the other on your phone',
      ],
      'correctAnswer': 1, // Index of the correct answer (b)
    },
  ];

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _finishQuiz() {
    // Calculate score
    int score = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedAnswers[i] == _questions[i]['correctAnswer']) {
        score++;
      }
    }
    // Show score in a dialog
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Quiz Completed!'),
            content: Text('Your score: $score/${_questions.length}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Return to Home Screen
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5D5), // Light yellow background
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5D5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Tests and quizzes',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_currentQuestionIndex + 1}/${_questions.length}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              currentQuestion['question'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...List.generate(currentQuestion['options'].length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: RadioListTile<int>(
                  value: index,
                  groupValue: _selectedAnswers[_currentQuestionIndex],
                  onChanged: (value) {
                    setState(() {
                      _selectedAnswers[_currentQuestionIndex] = value;
                    });
                  },
                  title: Text(currentQuestion['options'][index]),
                  activeColor: Colors.orange,
                ),
              );
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed:
                      _currentQuestionIndex > 0 ? _previousQuestion : null,
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
                      _selectedAnswers[_currentQuestionIndex] == null
                          ? null
                          : (_currentQuestionIndex < _questions.length - 1
                              ? _nextQuestion
                              : _finishQuiz),
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
                  child: Text(
                    _currentQuestionIndex < _questions.length - 1
                        ? 'Next'
                        : 'Finish',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
