import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //var _enteredTitle = '';
  final _titleController =
      TextEditingController(); //we also have to tell Flutter to delete the controller when the widget is removed from the widget tree
  final _amountController = TextEditingController();
  DateTime?
      _selectedDate; // we will update it in the _presentDatePicker() method and use it to store the selected date then refresh the UI with the new date
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    // we need to dispose the controllers when the widget is removed from the widget tree
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    // we need to use async and await to wait for the user to select a date
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      //it stores the data in Future, which is an object that will give us a value in the future
      context: context,
      initialDate: now,
      firstDate: DateTime(2021),
      lastDate: now,
    ); // below this line the code will use the selected date to update the state
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  //void _saveTitleInput(String inputValue) {
  //  _enteredTitle = inputValue;
  //}

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              //onChanged: _saveTitleInput,
              controller: _titleController,
              maxLength: 50,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text('Amount'), prefixText: '\$'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_month),
                      onPressed: _presentDatePicker,
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category, // not visible for the user but will be stored internally by the onChanged function
                            child: Text(
                              category.name.toUpperCase(),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                          return;
                        }
                      setState(() {
                        _selectedCategory = value;
                      });
                    }),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                        context); // closes the modal, we forward the context to the Navigator.pop() method
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add Expense'),
                ),
              ],
            ),
          ],
        ));
  }
}
