import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> questionSummary;
  const QuestionSummary({super.key, required this.questionSummary});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: questionSummary.map(
              (data) {
                return Row(
                  children: [
                    Text(((data['index'] as int) +1).toString(), style: const TextStyle(fontSize: 30),),
                    Expanded(
                      child: Column(
                        children: [
                          Text(data['question'] as String, style: const TextStyle(fontSize: 30),),
                          const SizedBox(height: 20,),
                          Text(data['user_answer'] as String, style: const TextStyle(fontSize: 30),),
                          Text(data['correct_answer'] as String, style: const TextStyle(fontSize: 30),),
                        ],
                      ),
                    )
                  ],
                );
              }
          ).toList(),
        ),
      ),
    );
  }
}