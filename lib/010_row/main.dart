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
      color: Colors.red,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: onClick,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white
              ),
              child: const Text(
                'button 1',
                style: TextStyle(fontSize: 20),
              )),
          Container(
            height: 200,
            child: ElevatedButton(
                onPressed: onClick,

                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white
                ),
                child: const Text(
                  'button 2',
                  style: TextStyle(fontSize: 20),
                )),
          ),
          ElevatedButton(
              onPressed: onClick,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white
              ),
              child: const Text(
                'button 3',
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }

  void onClick() {
    print("clicked");
  }
}
