import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Category { food, travel, leisure, work }

final formatter = DateFormat.yMd();

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
  String listExpense = "";

  void _openOverlay() {
    // showModelBottomSheet should be in statefulWidget
    showModalBottomSheet(
        // isScrollControlled is true make model full screen
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(
            onAddExpense: _addExpense,
          );
        });
  }

  void _addExpense(String title) {
    setState(() {
      listExpense = "$listExpense - $title";
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
        body: Column(
          children: [
            const Text('Content'),
            Text(listExpense),
          ],
        ));
  }
}

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(String title) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(2100, now.month, now.day);
    // showDatePicker is async function, it returns future
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _saveDate() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid input"),
                content: const Text(
                    "Make sure a valid title, amount, date was entered"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("OK"))
                ],
              ));
      return;
    }

    widget.onAddExpense(_titleController.text);
  }

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
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
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
          Row(
            children: [
              // ! let compiler know the variable can't null
              Text(_selectedDate == null
                  ? "select date:"
                  : formatter.format(_selectedDate!)),
              IconButton(
                  onPressed: _showDatePicker,
                  icon: const Icon(Icons.calendar_month))
            ],
          ),
          DropdownButton(
              value: _selectedCategory,
              items: Category.values
                  .map((category) => DropdownMenuItem(
                      value: category, child: Text(category.name)))
                  .toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _selectedCategory = value;
                });
              }),
          ElevatedButton(
            onPressed: () {
              // Navigator.pop() will close the current widget on the top of screen
              Navigator.pop(context);
            },
            child: const Text("cancel"),
          ),
          ElevatedButton(onPressed: _saveDate, child: const Text('show data '))
        ],
      ),
    );
  }
}
