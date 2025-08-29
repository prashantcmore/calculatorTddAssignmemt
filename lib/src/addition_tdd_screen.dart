import 'package:calculatortddassignment/src/addition_tdd_controller.dart';
import 'package:flutter/material.dart';

class AdditionTddScreen extends StatefulWidget {
  const AdditionTddScreen({super.key});

  @override
  State<AdditionTddScreen> createState() => _AdditionTddScreenState();
}

class _AdditionTddScreenState extends State<AdditionTddScreen> {
  final _numberController = TextEditingController();
  int _result = 0;
  final _additionTDDController = AdditionTDDController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addition TDD'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _numberController,
              decoration: const InputDecoration(
                labelText: 'Enter Numbers',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                final result = _additionTDDController.add(
                  _numberController.text,
                );
                setState(() {
                  _result = result;
                });
              },
              child: const Text('Add'),
            ),
            SizedBox(height: 12),
            Text(
              'Result: $_result',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
