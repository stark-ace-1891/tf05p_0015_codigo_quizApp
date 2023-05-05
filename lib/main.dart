import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: QuizPage());
  }
}

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QuizApp"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Prueba Prueba Prueba Prueba Prueba Prueba Prueba Prueba Prueba Prueba Prueba Prueba",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Verdadero",
              ),
              color: Colors.greenAccent,
            ),
          ),
          Expanded(
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Verdadero",
              ),
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
