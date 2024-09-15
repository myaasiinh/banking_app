import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../core/utils/sqlite_utils.dart';

class AddTransactionBottomSheet extends StatefulWidget {
  @override
  _AddTransactionBottomSheetState createState() => _AddTransactionBottomSheetState();
}

class _AddTransactionBottomSheetState extends State<AddTransactionBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nominalController = TextEditingController();
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _nominalController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

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
          const SizedBox(height: 10),
          _selectedImage != null
              ? Image.file(
            _selectedImage!,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          )
              : const Text('No image selected'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _pickImage,
            child: const Text('Pick Image'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (_nameController.text.isNotEmpty &&
                  _dateController.text.isNotEmpty &&
                  _nominalController.text.isNotEmpty &&
                  _selectedImage != null) {
                // Here you would convert the image file to a format that can be stored in the database
                final transaction = {
                  'iconUrl': _selectedImage!.path, // Store the path or image data
                  'name': _nameController.text,
                  'date': _dateController.text,
                  'nominal': double.tryParse(_nominalController.text) ?? 0.0,
                };
                await DBHelper().insertTransaction(transaction);
                Navigator.pop(context);
              } else {
                // Handle error
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please fill out all fields and select an image')),
                );
              }
            },
            child: const Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
