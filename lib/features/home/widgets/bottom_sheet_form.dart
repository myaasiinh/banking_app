import 'package:flutter/material.dart';
import '../../../core/utils/sqlite_utils.dart';
import '../../../data/transaction/model/credit_card_model.dart';

class AddCreditCardBottomSheet extends StatelessWidget {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController ownerController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: cardNumberController,
            decoration: InputDecoration(labelText: 'Card Number'),
          ),
          TextField(
            controller: ownerController,
            decoration: InputDecoration(labelText: 'Owner'),
          ),
          TextField(
            controller: expiryController,
            decoration: InputDecoration(labelText: 'Expiry Date'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final card = CreditCardModel(
                cardNumber: cardNumberController.text,
                owner: ownerController.text,
                expiry: expiryController.text,
                isPrimary: false, // Or set to true if you want
              );

              await DatabaseHelper.instance.insert(card);

              Navigator.pop(context); // Close the bottom sheet
              // Refresh the UI by notifying listeners or using setState
            },
            child: Text('Add Card'),
          ),
        ],
      ),
    );
  }
}
