
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/chart/chart_bar.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

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

  void _addExpense(Expense validatedExpense) {
    setState(() {
    _registeredExpenses.add(validatedExpense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); // we use the ScaffoldMessenger to clear any existing SnackBar before showing a new one
    ScaffoldMessenger.of(context).showSnackBar(SnackBar( // we use the ScaffoldMessenger to show a SnackBar when the user removes an expense from the list
      content: Text('Expense removed'),                 
      duration: Duration(seconds: 4),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (ctx) => NewExpense(addExpense: _addExpense,),);
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text('No expenses added yet'),);

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(expenses: _registeredExpenses, removeExpense: _removeExpense,);
    }

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
        Chart(  // we add the Chart widget to the column
          expenses: _registeredExpenses,
        ),  
        Expanded(child: mainContent,),
      ]
    ),)  ;
  }
  
}

