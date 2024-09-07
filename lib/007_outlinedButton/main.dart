import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "route",
    theme: ThemeData(fontFamily: 'Dancing script'),
    home: SafeArea(
        child: Scaffold(
      body: MyWidget(false),
    )),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatelessWidget {
  final bool loading;

  MyWidget(this.loading);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: OutlinedButton(
        onPressed: onClick,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,

        ),
        child: const Text("outlined button", style: TextStyle(fontSize: 30),),
      ),
    );
  }

  void onClick() {
    print("clicked");
  }
}
