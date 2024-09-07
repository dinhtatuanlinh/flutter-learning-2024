
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/answerButton.dart';

import 'data/Questions.dart';

class ContentScreen extends StatefulWidget {
  final void Function(String answer) onChooseAnswer;
  const ContentScreen({super.key, required this.onChooseAnswer});


  @override
  State<ContentScreen> createState() {
    return _ContentScreen();
  }
}

class _ContentScreen extends State<ContentScreen> {
  var currentQuestionIndex = 0;
  @override
  void initState()  {
    super.initState();
  }

  void answerQuestion(String answer) {
    widget.onChooseAnswer(answer);
    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = Questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.question, style: GoogleFonts.lato(color: Colors.teal, fontSize: 40)),
            const SizedBox(height: 30,),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, () {
                answerQuestion(answer);
              });
            })
          ],
        ),
      ),
    );
  }

  void onClick() {
    print("clicked");
  }
}