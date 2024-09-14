import 'package:flutter/material.dart';
import 'package:banking_app/core/global_component/flutter_package.dart'; 
import '../../core/global_component/credit_card_custom.dart';
import '../../data/transaction/dummy/transaction_dummy.dart';
import '../../data/transaction/model/transaction_model.dart';
import 'widgets/credit_card_widget.dart'; // Importing the model for transactions

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = TransactionData.getTransactions(); // Fetching dummy transactions

    return BaseWidgetContainer(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildHeader(), // Top header
          const SizedBox(height: 20),
          _buildCreditCardsSection(), // Section for cards
          const SizedBox(height: 20),
          _buildTransactionsSection(transactions), // Section for transactions
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Your Card Information',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCreditCardsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'All Credit Cards (2)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CreditCard(
                cardNumber: '**** 5482',
                owner: 'Jordan Smith',
                expiry: '04/24',
                isPrimary: true,
              ),
              const CreditCard(
                cardNumber: '**** 4168',
                owner: 'Jordan Smith',
                expiry: '04/24',
              ),
              _buildAddButton(), // Add button widget
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () {
        // Action when "Add" button is pressed
      },
      child: Container(
        height: 100,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Widget _buildTransactionsSection(List<Transaction> transactions) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Latest Transactions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Column(
            children: transactions
                .map((transaction) => CreditCardCustom(
                      serviceName: transaction.name,
                      dateTime: transaction.date,
                      amount: transaction.nominal > 0
                          ? '+\$${transaction.nominal}'
                          : '-\$${transaction.nominal.abs()}',
                      imageUrl: transaction.iconUrl,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
