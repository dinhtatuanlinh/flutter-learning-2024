import 'package:flutter/material.dart';

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
    return Stack(
      children: [
        // need to add path to the pubspec.yaml file to let flutter know where to save the image
        Image.asset(
          'assets/images/Screenshot 2024-03-05 at 21.43.15.png',
          height: 1000,
        ),
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text('title',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('press'),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onClick() {
    print("clicked");
  }
}
