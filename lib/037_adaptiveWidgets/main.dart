import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'expenseList.dart';

enum Category { food, travel, leisure, work }

final formatter = DateFormat.yMd();

void main() {
  runApp(MaterialApp(
    title: "route",
    theme: ThemeData(fontFamily: 'Dancing script'),
    home: const SafeArea(
      child: Scaffold(
        body: MyWidget(),
      ),
    ),
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
  List<String> expenses = [];

  void _openOverlay() {
    // showModelBottomSheet should be in statefulWidget
    showModalBottomSheet(
      // apply safe are to model
      useSafeArea: true,
      // isScrollControlled is true make model full screen
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(
          onAddExpense: _addExpense,
        );
      },
    );
  }

  void _removeExpense(String expense) {
    final expenseIndex = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });
    // we need clearSnackBars if we remove multiple items continuously
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("expense deleted"),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            expenses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  void _addExpense(String title) {
    setState(() {
      expenses.add(title);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final lengthOfHorizontal = MediaQuery.of(context).size.width;
    final lengthOfVertical = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('this is AppBar'),
        actions: [
          IconButton(onPressed: _openOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: lengthOfHorizontal < lengthOfVertical
          ? Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 2,
                        color: Colors.red,
                      ),
                    ),
                    child: const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  ),
                ),
                // we need wrap ExpenseList inside Expanded widget because now column dont know the number of list
                Expanded(
                    child: ExpenseList(
                  expenses: expenses,
                  onRemoveExpense: _removeExpense,
                ))
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 2,
                        color: Colors.red,
                      ),
                    ),
                    child: const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  ),
                ),
                // we need wrap ExpenseList inside Expanded widget because now column dont know the number of list
                Expanded(
                    child: ExpenseList(
                  expenses: expenses,
                  onRemoveExpense: _removeExpense,
                ))
              ],
            ),
    );
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

  void _showDialog() {
    // check platform is android or ios
    if (Platform.isAndroid) {
      showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
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
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid input"),
          content:
              const Text("Make sure a valid title, amount, date was entered"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  void _saveDate() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      _showDialog();
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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.pop() will close the current widget on the top of screen
              Navigator.pop(context);
            },
            child: const Text("cancel"),
          ),
          ElevatedButton(onPressed: _saveDate, child: const Text('show data ')),
        ],
      ),
    );
  }
}
