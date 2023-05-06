import 'package:flutter/material.dart';
import 'package:tf05p_0015_codigo_quizapp/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();

  checkAnswer(answer) {
    if (quizBrain.isFInished() == true) {
      if (scoreKeeper.length < quizBrain.getQuestionsLength()) {
        quizBrain.nextQuestion();
        bool answerCorrect = quizBrain.getQuestionAnswer();
        if (answerCorrect == answer) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.greenAccent,
          ));
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.redAccent,
          ));
        }
      }
      _onCustomAnimationAlertPressed(context);
    } else {
      bool answerCorrect = quizBrain.getQuestionAnswer();
      if (answerCorrect == answer) {
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Colors.greenAccent,
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.close,
          color: Colors.redAccent,
        ));
      }
      quizBrain.nextQuestion();
    }
    setState(() {});
  }

  _onCustomAnimationAlertPressed(context) {
    Alert(
      context: context,
      type: AlertType.info,
      title: "QuizApp",
      desc: "El Quiz ha finalizado.",
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: scoreKeeper,
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            quizBrain.restart();
            scoreKeeper.clear();
          },
          width: 120,
          child: const Text(
            "Aceptar",
            style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.blue,
                fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2d42),
      appBar: AppBar(
        backgroundColor: Color(0xff2b2d42),
        title: const Text("QuizApp"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkAnswer(true);
                },
                color: Colors.greenAccent,
                child: const Text(
                  "Verdadero",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkAnswer(false);
                },
                color: Colors.redAccent,
                child: const Text(
                  "Verdadero",
                ),
              ),
            ),
          ),
          // Row(
          //   children: scoreKeeper,
          // ),
        ],
      ),
    );
  }
}
