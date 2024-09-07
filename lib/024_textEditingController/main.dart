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
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  // we need to dispose the controller because it will exist even we close the widget
  // the dispose function will call when the widget closed while the _titleController.dispose() called to remove data
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('title'),
            ),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: const InputDecoration(
              prefixText: "\$ ",
              label: Text("amount"),
            ),
          ),
          ElevatedButton(onPressed: ()=>print(_titleController.text), child: const Text('show data '))
        ],
      ),
    );
  }
}