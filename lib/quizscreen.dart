import 'package:flutter/material.dart';
import 'package:quiz_app/data/questionlist.dart';

import 'package:quiz_app/homescreen.dart';
import 'package:quiz_app/questionscreen.dart';
import 'package:quiz_app/reslutscreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectAnswer.add(answer);
    if (selectAnswer.length == questions.length) {
      setState(() {
        //selectAnswer = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void onrestart() {
    setState(() {
      selectAnswer = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget startScreen = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      startScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      startScreen = ResultScreen(
        chooseAnswer: selectAnswer,
        restart: onrestart,
      );
    }

    //final startScreen= activeScreen == 'start-screen' ? StartScreen(switchScreen)
    //        : const QuestionsScreen();

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: startScreen
          /*activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : const QuestionsScreen()*/
          ,
        ),
      ),
    );
  }
}
