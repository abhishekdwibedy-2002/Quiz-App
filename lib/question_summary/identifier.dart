import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.correctAnswer, required this.questionIndex});

  final int questionIndex;
  final bool correctAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: correctAnswer
            ? const Color.fromARGB(255, 64, 245, 255)
            : const Color.fromARGB(255, 137, 50, 145),
        borderRadius: BorderRadius.circular(400),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 12, 10, 10),
        ),
      ),
    );
  }
}
