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
        margin: const EdgeInsets.only(top: 20, right: 20, bottom: 20, left: 20),
        // text button only
        // child: TextButton(
        //   onPressed: onClick,
        //   style: TextButton.styleFrom(
        //     foregroundColor: Colors.amber,
        //     backgroundColor: Colors.blue,
        //     // maximumSize: const Size(200, 20),
        //     padding: const EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //     elevation: 20,
        //     shadowColor: Colors.deepOrange.withOpacity(0.7),
        //     side: const BorderSide(width: 1, color: Colors.black87)
        //   ),
        //   child: const Text(
        //     'click',
        //     style: TextStyle(fontSize: 30),
        //   ),
        // ),

        // text with icon button
        // child: TextButton.icon(
        //   onPressed: onClick,
        //   style: TextButton.styleFrom(
        //       foregroundColor: Colors.amber,
        //       backgroundColor: Colors.blue,
        //       // maximumSize: const Size(200, 20),
        //       padding: const EdgeInsets.only(
        //           top: 10, right: 20, bottom: 10, left: 20),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(20),
        //       ),
        //       elevation: 20,
        //       shadowColor: Colors.deepOrange.withOpacity(0.7),
        //       side: const BorderSide(width: 1, color: Colors.black87)),
        //   icon: const Icon(
        //     Icons.add,
        //     size: 30,
        //   ),
        //   label: const Text(
        //     'click',
        //     style: TextStyle(fontSize: 30),
        //   ),
        // )

        //     disable button
        child: TextButton(
          onPressed: null,
            style: TextButton.styleFrom(
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.white,
            ),
          child: const Text("disable text button", style: TextStyle(fontSize: 30)),
        ));
  }

  void onClick() {
    print("clicked");
  }
}
