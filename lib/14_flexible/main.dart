import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    title: "route",
    theme: ThemeData(fontFamily: 'Dancing script'),
    home: const SafeArea(
        child: Scaffold(
      body: MyWidget(false),
    )),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatelessWidget {
  final bool loading;

  const MyWidget(this.loading, {super.key});

  @override
  Widget build(BuildContext context) {
    // sizedBox for creating space between widget
    return Column(
      children: [
        Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(
              height: 100,
              color: Colors.yellow,
            )),
        Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
          color: Colors.blue,
        )),
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
          color: Colors.orange,
        )),
      ],
    );
  }

  void onClick() {
    print("clicked");
  }
}
