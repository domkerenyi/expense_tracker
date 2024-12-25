import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() {
    final now = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2021),
      lastDate: now,
    );
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
                    decoration: const InputDecoration(label: Text('Amount'), prefixText: '\$'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Selected Date'),
                      IconButton(
                        icon: const Icon(Icons.calendar_month),
                        onPressed: _presentDatePicker,
                      ),
                    ],
                ))],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // closes the modal, we forward the context to the Navigator.pop() method
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
