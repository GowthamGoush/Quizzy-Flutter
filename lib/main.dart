import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzy_flutter_app/quizData.dart';

void main() {
  scoreBoardSetUp();
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: QuizzyApp(),
        ),
      ),
    ),
  ));
}

class QuizzyApp extends StatefulWidget {
  @override
  _QuizzyAppState createState() => _QuizzyAppState();
}

QuizData quizData = new QuizData();

List<Widget> scoreIcons = [];

void scoreBoardSetUp() {
  scoreIcons.clear();

  for (int i = 0; i < quizData.getQuizLength(); i++) {
    scoreIcons.add(Icon(
      Icons.check_box_outline_blank,
      color: Colors.grey,
    ));
  }
}

void buttonClicked(bool clickedAnswer) {
  if (quizData.quizOver) {
    return;
  }

  int quizNumber = quizData.getQuizNumber();

  scoreIcons.removeAt(quizNumber);

  if (clickedAnswer == quizData.getQuizAnswer()) {
    scoreIcons.insert(
        quizNumber,
        Icon(
          Icons.check,
          color: Colors.green,
        ));
  } else {
    scoreIcons.insert(
        quizNumber,
        Icon(
          Icons.close,
          color: Colors.red,
        ));
  }

  quizData.nextQuestion();
}

class _QuizzyAppState extends State<QuizzyApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  quizData.getQuizText(),
                  style: TextStyle(
                      fontSize: 18.0,
                      wordSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: Text(
                  'True',
                  style: TextStyle(fontSize: 16.0),
                ),
                onPressed: () {
                  setState(() {
                    buttonClicked(true);
                  });
                },
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: Text(
                  'False',
                  style: TextStyle(fontSize: 16.0),
                ),
                onPressed: () {
                  setState(() {
                    buttonClicked(false);
                  });
                },
              ),
            )),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: scoreIcons)
      ],
    );
  }
}
