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
      body: const Column(
        children: [
          Text('Content'),
          NewExpense()
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