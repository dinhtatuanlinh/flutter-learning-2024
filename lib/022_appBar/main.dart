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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('this is AppBar'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text('Content'),
          ElevatedButton(onPressed: () {}, child: const Text('button'))
        ],
      )
    );
  }
}

