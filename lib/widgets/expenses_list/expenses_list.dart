import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          background: Container(color: Theme.of(context).colorScheme.error,
          margin: Theme.of(context).cardTheme.margin,),
          onDismissed: (e) {
            removeExpense(expenses[index]);
          },
          key: ValueKey(expenses[index]),
          child: ExpenseItem(expense: expenses[index])),
    );
  }
}
