import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "route",
    theme: ThemeData(
      fontFamily: 'Dancing script'
    ),
    home: SafeArea(child: Scaffold(
      body: Center(child: MyWidget(false),),
    )),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatelessWidget {
  final bool loading;

  MyWidget(this.loading);
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Lorem Ipsum is simply dummy text of the printing and typesetting '
          'industry. Lorem Ipsum has been the industry\'s standard dummy '
          'text ever since the 1500s, when an unknown printer took a galley '
          'of type and scrambled it to make a type specimen book. It has '
          'survived not only five centuries, but also the leap into electronic '
          'typesetting, remaining essentially unchanged. It was popularised '
          'in the 1960s with the release of Letraset sheets containing Lorem '
          'Ipsum passages, and more recently with desktop publishing software '
          'like Aldus PageMaker including versions of Lorem Ipsum.',
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 27
      ),
    );
  }

}