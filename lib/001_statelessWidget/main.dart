import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "route",
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
    return loading ? const CircularProgressIndicator() : const Text("this is statelessWidget");
  }

}