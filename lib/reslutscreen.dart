import 'package:flutter/material.dart';
import 'package:quiz_app/data/questionlist.dart';
import 'package:quiz_app/questionsummary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chooseAnswer, required this.restart});

  final List<String> chooseAnswer;
  final void Function() restart;

  List<Map<String, Object>> summaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = summaryData();
    final totalNumber = questions.length;
    final correctNumber = summary
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctNumber out of $totalNumber questions correctly!',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(169, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summary),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              icon: const Icon(Icons.refresh),
              style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(180, 255, 255, 255)),
              onPressed: restart,
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
