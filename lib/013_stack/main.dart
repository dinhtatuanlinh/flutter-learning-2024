import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

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
      color: Colors.blue,
      width: 500,
      height:500,
      child: Stack(
        // fit: StackFit.expand,
        fit: StackFit.loose,
        alignment: Alignment.center,
        // clipBehavior helps children to be able to larger than stack
        // clipBehavior: Clip.none,
        children: [
          Container(
            color: Colors.green,
            width: 400,
            height: 400,

          ),
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              color: Colors.red,
              width: 300,
              height: 700,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              color: Colors.yellow,
              width: 200,
              height: 200,
            ),
          )
        ],
      ),
    );
  }

  void onClick() {
    print("clicked");
  }
}
