
import 'package:flutter/material.dart';
import 'package:my_app/20_showListData/data/Questions.dart';
import 'package:my_app/questionSummaryScreen.dart';

class ResultScreen extends StatelessWidget {
  final List<String> answers;
  final void Function() onBackToStart;
  const ResultScreen({super.key, required this.answers, required this.onBackToStart});

  List<Map<String, Object>> getSummaryData() {
      final List<Map<String, Object>> summary = [];
      for (var i = 0; i < answers.length; i++){
        summary.add({
          'index': i,
          'question': Questions[i].question,
          'correct_answer': Questions[i].answers[0],
          'user_answer': answers[i]
        });
      }
      return summary;
    }
  @override
  Widget build(BuildContext context) {
    final numberOfQuestions = Questions.length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('The number of questions is $numberOfQuestions', style: const TextStyle(fontSize: 30),),
            const SizedBox(height: 30,),
            const Text('List answers and questions', style: TextStyle(fontSize: 30),),
            const SizedBox(height: 30,),
            QuestionSummary(questionSummary: getSummaryData(),),
            TextButton(onPressed: onBackToStart, child: const Text("Restart Question"))
          ],
        ),
      ),
    );
  }
}