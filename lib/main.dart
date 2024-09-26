import 'package:flutter/material.dart';
import 'package:quizzler/quiz_page.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}
