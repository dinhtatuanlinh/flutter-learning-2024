import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
    // sizedBox for creating space between widget
    return Container(
        child: Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.green,
            height: 150,
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            height: 150,
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            height: 150,
          ),
          flex: 1,
        ),
      ],
    ));
  }

  void onClick() {
    print("clicked");
  }
}
