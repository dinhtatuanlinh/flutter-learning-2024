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
      // child: ElevatedButton(
      //     onPressed: onClick,
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: Colors.green,
      //       foregroundColor: Colors.white,
      //       minimumSize: const Size(240, 50),
      //       padding: const EdgeInsets.all(10),
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(10)
      //       ),
      //       elevation: 10,
      //       shadowColor: Colors.blue.withOpacity(0.5),
      //       side: const BorderSide(
      //         width: 2,
      //         color: Colors.black,
      //       )
      //     ),
      //     child: const Text(
      //       'Elevated button',
      //       style: TextStyle(fontSize: 30),
      //     )),

      //   elevated button with icon
      child: ElevatedButton.icon(
          onPressed: onClick,
          icon: const Icon(
            Icons.add,
            size: 30,
          ),
          label: const Text(
            'Elevated button',
            style: TextStyle(fontSize: 30),
          )),
    );
  }

  void onClick() {
    print("clicked");
  }
}
