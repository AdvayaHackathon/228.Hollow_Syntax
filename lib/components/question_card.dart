import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final List<String> options;
  final String correctAnswer;
  final Function(bool) onAnswer;

  const QuestionCard({
    super.key,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                question,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ...options.map((option) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: ElevatedButton(
                      onPressed: () => onAnswer(option == correctAnswer),
                      style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                      child: Text(option),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
