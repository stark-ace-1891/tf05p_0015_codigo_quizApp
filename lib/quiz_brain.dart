import 'package:tf05p_0015_codigo_quizapp/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  //_questions -> cuando agregamos un subguion, quiere decir que es un campo privado, sin acceso extertno
  final List<Question> _questions = [
    Question(questionText: "El hombre llego a la luna?", questionAnswer: true),
    Question(questionText: "Haz almorzado algo?", questionAnswer: true),
    Question(questionText: "Sientes frío?", questionAnswer: false),
    Question(questionText: "Vas a salir mañana?", questionAnswer: true),
  ];

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  //verificar si el quiz ha terminado
  bool isFInished() {
    return _questionNumber >= _questions.length - 1;
  }

  //Reiniciar el quiz
 void restart() {
    _questionNumber = 0;
  }
}
