import 'package:flutter/material.dart';
import 'package:tf05p_0015_codigo_quizapp/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: QuizPage());
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;

  List<String> questions = [
    "El hombre llego a la luna?",
    "Haz almorzado algo?",
    "Sientes frío?",
    "Vas a salir mañana?",
  ];
  List<bool> answers = [
    true,
    true,
    false,
    true,
  ];

  List<Question> questions2 = [
    Question(questionText: "El hombre llego a la luna?", questionAnswer: true),
    Question(questionText: "Haz almorzado algo?", questionAnswer: true),
    Question(questionText: "Sientes frío?", questionAnswer: false),
    Question(questionText: "Vas a salir mañana?", questionAnswer: true),
  ];

  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2d42),
      appBar: AppBar(
        backgroundColor: Color(0xff2b2d42),
        title: Text("QuizApp"),
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
                  questions[questionNumber],
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                  print(questionNumber);
                  if (questionNumber < questions.length) {
                    bool answerCorrect = answers[questionNumber];
                    if (answerCorrect == true) {
                      scoreKeeper.add(Icon(
                        Icons.check,
                        color: Colors.greenAccent,
                      ));
                    } else {
                      scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.redAccent,
                      ));
                    }
                    if (questionNumber < questions.length - 1) {
                      questionNumber++;
                    }
                  }
                  setState(() {});
                },
                child: Text(
                  "Verdadero",
                ),
                color: Colors.greenAccent,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Verdadero",
                ),
                color: Colors.redAccent,
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
