import 'package:flutter/material.dart';

import 'contentScreen.dart';

void main() {
  runApp(MaterialApp(
    title: "route",
    theme: ThemeData(fontFamily: 'Dancing script'),
    home: SafeArea(
        child: Scaffold(
      body: MyWidget(),
    )),
    debugShowCheckedModeBanner: false,
  ));
}
class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyWidget();
  }
}
class _MyWidget extends State<StatefulWidget> {

  late Widget activeScreen;

  @override
  void initState() {
    activeScreen = Bts(switchScreen: switchScreen);
    super.initState();
  }
  void switchScreen() {
    setState(() {
      activeScreen = const ContentScreen();
    });
  }
  @override
  Widget build(BuildContext context) {
    // sizedBox for creating space between widget
    return activeScreen;
  }

  void onClick() {
    print("clicked");
  }
}

class Bts extends StatelessWidget {
  final void Function() switchScreen;

  const Bts({super.key, required this.switchScreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: OutlinedButton(
        onPressed: switchScreen,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
        child: const Text(
          "See detail!!",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
