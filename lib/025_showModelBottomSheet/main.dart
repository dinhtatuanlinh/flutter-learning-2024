import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    title: "route",
    theme: ThemeData(fontFamily: 'Dancing script'),
    home: const SafeArea(
        child: Scaffold(
      body: MyWidget(),
    )),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatefulWidget {
   const MyWidget({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyWidget();
  }
}

class _MyWidget extends State<MyWidget> {

  void _openOverlay() {
    // showModelBottomSheet should be in statefulWidget
    showModalBottomSheet(context: context, builder: (ctx) {
      return const NewExpense();
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('this is AppBar'),
        actions: [
          IconButton(onPressed: _openOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: const Column(
        children: [
          Text('Content'),
        ],
      )
    );
  }
}

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('title'),
            ),
          )
        ],
      ),
    );
  }
}