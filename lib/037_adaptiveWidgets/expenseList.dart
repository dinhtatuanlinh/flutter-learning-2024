import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<String> expenses;
  final void Function(String expense) onRemoveExpense;

  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, i) {
        // widget dismissible allow swipe action to remove an item in the list
        return Dismissible(
          key: ValueKey(expenses[i]),
          onDismissed: (direction) {
            print(direction);
            onRemoveExpense(expenses[i]);
          },
          child: Text(expenses[i]),
        );
      },
    );
  }
}
