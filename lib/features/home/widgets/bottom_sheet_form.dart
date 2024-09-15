import 'package:flutter/material.dart';
import '../../../core/utils/sqlite_utils.dart';

class AddTransactionBottomSheet extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _iconUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Service Name'),
          ),
          TextField(
            controller: _dateController,
            decoration: const InputDecoration(labelText: 'Date'),
          ),
          TextField(
            controller: _nominalController,
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _iconUrlController,
            decoration: const InputDecoration(labelText: 'Icon URL'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final transaction = {
                'iconUrl': _iconUrlController.text,
                'name': _nameController.text,
                'date': _dateController.text,
                'nominal': double.parse(_nominalController.text),
              };
              await DBHelper().insertTransaction(transaction);
              Navigator.pop(context);
            },
            child: const Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
