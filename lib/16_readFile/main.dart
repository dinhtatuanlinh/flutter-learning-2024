import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() async {
  // Ensure that the Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  String content;
  try {
    content = await rootBundle.loadString('assets/files/text.txt');
  } catch (e) {
    print("Error reading asset file: $e");
    content = "aaaaaaa";
  }
  runApp(MaterialApp(
    title: "route",
    theme: ThemeData(fontFamily: 'Dancing script'),
    home: SafeArea(
        child: Scaffold(
          body: MyWidget(content: content,),
        )),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatelessWidget {
  final String content;
  MyWidget({super.key, required this.content});

  @override
  void initState() async {
    print("aaaaa");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              content,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                  fontSize: 27
              ),
            ),
          ),
          OutlinedButton(
            onPressed: onClick,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              "outlined button",
              style: TextStyle(fontSize: 30),
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
