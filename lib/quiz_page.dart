// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 37,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: const Border(bottom: BorderSide(color: Colors.white)),
                color: Colors.grey.shade800),
            child: const Column(
              children: [
                SizedBox(
                  width: 8,
                ),
                Center(
                  child: Text(
                    'Quizzler',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText() ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        optionButton(
          option: 'True',
          color: Colors.green,
          onPressed: () {
            bool? correctAnswer = quizBrain.getCorrectAnswer();

            if (correctAnswer == true) {
              print('User got it right!');
            } else {
              print('User got it wrong');
            }

            setState(() {
              quizBrain.nextQuestion();
              scoreKeeper.add(const Icon(
                Icons.check,
                color: Colors.green,
              ));
            });
          },
        ),
        optionButton(
            option: 'False',
            color: Colors.red,
            onPressed: () {
              bool? correctAnswer = quizBrain.getCorrectAnswer();

              if (correctAnswer == false) {
                print('User got it right!');
              } else {
                print('User got it wrong');
              }

              setState(() {
                quizBrain.nextQuestion();
                scoreKeeper.add(const Icon(
                  Icons.close,
                  color: Colors.red,
                ));
              });
            }),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: const Border(top: BorderSide(color: Colors.white)),
                color: Colors.grey.shade800),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: scoreKeeper.isEmpty,
                  child: const Center(
                    child: Text(
                      'Your result will show here!',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Row(
                  children: scoreKeeper,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget optionButton(
      {required String option,
      required Color color,
      required VoidCallback onPressed}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          onPressed: () {
            onPressed.call();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
            side: MaterialStateProperty.all(
              const BorderSide(color: Colors.white, width: 2),
            ),
          ),
          child: Text(
            option,
          ),
        ),
      ),
    );
  }
}
