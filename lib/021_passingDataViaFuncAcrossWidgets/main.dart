import 'package:flutter/material.dart';
import 'package:my_app/data/Questions.dart';
import 'package:my_app/resultScreen.dart';

import 'contentScreen.dart';

void main() {
  runApp(MaterialApp(
    title: "route",
    theme: ThemeData(fontFamily: 'Dancing script'),
    home: SafeArea(
        child: Scaffold(
      body: MyWidget(),
    )),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  @override
  State<MyWidget> createState() {
    return _MyWidget();
  }
}

class _MyWidget extends State<MyWidget> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";
  void switchScreen() {
    setState(() {
      activeScreen = "content-screen";
    });
  }
  void chooseAnswer(answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == Questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void backToStart() {
    selectedAnswers = [];
    setState(() {
      setState(() {
        activeScreen = "start-screen";
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget screen = Bts(switchScreen: switchScreen,);
    if (activeScreen == "content-screen") {
      screen = ContentScreen(onChooseAnswer: chooseAnswer,);
    }
    if (activeScreen == "result-screen") {
      screen = ResultScreen(answers: selectedAnswers, onBackToStart: backToStart,);
    }
    // sizedBox for creating space between widget
    return screen;
  }

  void onClick() {
    print("clicked");
  }
}

class Bts extends StatelessWidget {
  final void Function() switchScreen;

  const Bts({super.key, required this.switchScreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: OutlinedButton(
        onPressed: switchScreen,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
        child: const Text(
          "See detail!!",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
