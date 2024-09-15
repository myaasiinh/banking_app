import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../utils/sqlite_utils.dart';

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
          Text(
            'Add Transaction',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _nameController,
            labelText: 'Service Name',
          ),
          const SizedBox(height: 12),
          _buildTextField(
            controller: _dateController,
            labelText: 'Date',
            keyboardType: TextInputType.datetime,
          ),
          const SizedBox(height: 12),
          _buildTextField(
            controller: _nominalController,
            labelText: 'Amount',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          _buildImagePicker(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (_nameController.text.isNotEmpty &&
                  _dateController.text.isNotEmpty &&
                  _nominalController.text.isNotEmpty &&
                  _selectedImage != null) {
                final transaction = {
                  'iconUrl': _selectedImage!.path, // Store the path or image data
                  'name': _nameController.text,
                  'date': _dateController.text,
                  'nominal': double.tryParse(_nominalController.text) ?? 0.0,
                };
                await DBHelper().insertTransaction(transaction);
                Navigator.pop(context);
              } else {
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      keyboardType: keyboardType,
    );
  }

  Widget _buildImagePicker() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: _selectedImage != null
          ? Image.file(
        _selectedImage!,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      )
          : const Icon(Icons.image, size: 80),
      title: const Text('Select Image'),
      trailing: ElevatedButton(
        onPressed: _pickImage,
        child: const Text('Pick Image'),
      ),
    );
  }
}
