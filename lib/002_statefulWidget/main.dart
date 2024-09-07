import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "route",
    home: SafeArea(child: Scaffold(
      body: Center(child: MyStatefulWidget(false),),
    )),
    debugShowCheckedModeBanner: false,
  ));
}

class MyStatefulWidget extends StatefulWidget {
  final bool loading;

  const MyStatefulWidget(this.loading, {super.key});

  @override
  State<StatefulWidget> createState() {
    return ImpStatefulWidget();
  }

}

class ImpStatefulWidget extends State<MyStatefulWidget> {
  // properties in this func is called states

  late bool stateLoading;

  // func initState will be run before func build run
  // we can put logic to set states in this func
  @override
  void initState() {
    // we use property widget to access property loading of class MyStatefulWidget above
    stateLoading = widget.loading;
  }

  @override
  Widget build(BuildContext context) {
    return stateLoading ? const CircularProgressIndicator() : FloatingActionButton(onPressed: onClick);
  }

  void onClick() {
    // func setState is used to set value to states
    setState(() {
      stateLoading = true;
    });
  }
}