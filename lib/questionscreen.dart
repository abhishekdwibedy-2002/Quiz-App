import 'package:flutter/material.dart';
import 'package:quiz_app/answerbutton.dart';
import 'package:quiz_app/data/questionlist.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var activeQuestion = 0;
  void currentstateQuestion(String onSelectAnswer) {
    widget.onSelectAnswer(onSelectAnswer);
    setState(() {
      activeQuestion += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[activeQuestion];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(169, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getAnswer().map(
                  (answer) => AnswerButton(
                      answerText: answer,
                      onTap: () {
                        currentstateQuestion(answer);
                      }),
                )
          ],
        ),
      ),
    );
  }
}
