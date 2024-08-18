import 'package:flutter/material.dart';

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

class MyWidget extends StatelessWidget {

  Widget activeScreen = const Bts();

  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // sizedBox for creating space between widget
    return Stack(
      children: [
        // need to add path to the pubspec.yaml file to let flutter know where to save the image
        activeScreen,
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

class Bts extends StatelessWidget {
  const Bts({super.key});

  void onClick() {
    print("clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: null,
            style: TextButton.styleFrom(
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.white,
            ),
            child: const Text("disable text button",
                style: TextStyle(fontSize: 30)),
          ),
          ElevatedButton.icon(
              onPressed: onClick,
              icon: const Icon(
                Icons.add,
                size: 30,
              ),
              label: const Text(
                'Elevated button',
                style: TextStyle(fontSize: 30),
              )),
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
}
