import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "route",
    theme: ThemeData(
      fontFamily: 'Dancing script'
    ),
    home: SafeArea(child: Scaffold(
      body:  MyWidget(false),
    )),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatelessWidget {
  final bool loading;

  MyWidget(this.loading);
  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.amber,
      margin: EdgeInsets.only(left: 20, top: 10),
      child: Padding(
        padding: EdgeInsets.only(right: 30, bottom: 20),
        child: Text(
          'Lorem Ipsum is simply dummy text',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: 27
          ),
        ),
      ),
    );
  }

}