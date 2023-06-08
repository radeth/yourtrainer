import 'package:flutter/material.dart';

class AddExcersicePage extends StatefulWidget {
  const AddExcersicePage({super.key});

  @override
  State<AddExcersicePage> createState() => _AddExcersicePageState();
}

class _AddExcersicePageState extends State<AddExcersicePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(child: Text('You have pressed the button $_count times.')),
      backgroundColor: Colors.blueGrey.shade200,
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
