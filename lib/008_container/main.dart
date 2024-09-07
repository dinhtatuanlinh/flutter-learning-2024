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
    return Container(
      // color: Colors.green,
      width: 200,
      height: 200,
      // alignment is used for positioning child
      // alignment: Alignment.center,
      // alignment: const Alignment(1.0, 1.0),
      // alignment: const FractionalOffset(0.75, 0.75),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(20),
      // if using decoration you should remove color field
      decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 2, color: Colors.red)),
      transform: Matrix4.rotationZ(0.2),
      // if a container without child the container will cover all screen
      // if a container with child, the container will cover only the child
      child: const Text(
        'container',
        style: TextStyle(fontSize: 40, color: Colors.white),
      ),
    );
  }

  void onClick() {
    print("clicked");
  }
}
