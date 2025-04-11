import 'dart:convert';
import 'package:flutter/material.dart';
import 'result_screen.dart';
import 'components/question_card.dart';
import 'package:flutter/services.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List questions = [];
  int currentIndex = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString('assets/questions/math.json');
    final data = await json.decode(response);
    setState(() {
      questions = data["questions"];
    });
  }

  void answerQuestion(bool isCorrect) {
    if (isCorrect) score++;
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ResultScreen(score: score, total: questions.length)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final question = questions[currentIndex];
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Time")),
      body: QuestionCard(
        question: question["question"],
        options: List<String>.from(question["options"]),
        correctAnswer: question["answer"],
        onAnswer: answerQuestion,
      ),
    );
  }
}
