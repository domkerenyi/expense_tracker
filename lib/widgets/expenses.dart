
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
  
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,),
    Expense(
      title: 'Cinema',
      amount: 20.00,
      date: DateTime.now(),
      category: Category.leisure,)
  ];  

  void _openAddExpenseOverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => const NewExpense(),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.add),
          onPressed: _openAddExpenseOverlay,),
        ],
        title: const Text('Expenses Tracker'),
      ),
      body: Column(
      children: [
        const Text('The chart'),
        Expanded(child: ExpensesList(expenses: _registeredExpenses,)),
      ]
    ),)  ;
  }
  
}

