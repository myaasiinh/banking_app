import 'package:banking_app/core/constants/colors.dart';
import 'package:banking_app/core/constants/string.dart';
import 'package:banking_app/core/global_component/flutter_package.dart';
import 'package:banking_app/core/global_component/bottom_sheet_form.dart';
import 'package:flutter/material.dart';

import '../../core/global_component/credit_card_custom.dart';
import '../../core/utils/sqlite_utils.dart';
import '../../data/transaction/model/transaction_model.dart';
import 'widgets/credit_card_widget.dart'; // Importing the model for transactions

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Transaction> _transactions = [];

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  Future<void> _loadTransactions() async {
    final data = await DBHelper().getTransactions();
    setState(() {
      _transactions = data
          .map((e) => Transaction(
                iconUrl: e['iconUrl'],
                name: e['name'],
                date: e['date'],
                nominal: e['nominal'],
              ))
          .toList();
    });
  }

  void _showAddTransactionBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => AddTransactionBottomSheet(),
    ).then((_) => _loadTransactions()); // Reload transactions after adding
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      backgroundColor: ColorUtils.purplishBlue,
      actvateScroll: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          _buildHeader(),
          const SizedBox(height: 10),
          _buildAfterHeader(),
          _buildCreditCardsSection(),
          _buildTransactionsSection(),
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
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ColorUtils.purpleHoneycreeper,
            ),
            child: IconButton(
              icon: const Icon(Icons.person_2_outlined),
              onPressed: () {},
              color: ColorUtils.backgroundColors,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ColorUtils.purpleHoneycreeper,
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications_outlined),
              color: ColorUtils.backgroundColors,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAfterHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            StringText.yourcardinfo,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 170,
                child: Text(
                  StringText.allcreditcard,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.visible,
                ),
              ),
              _buildAddButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCreditCardsSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreditCard(
            cardNumber: '**** 5482',
            owner: 'Jordan Smith',
            expiry: '04/24',
            isPrimary: true,
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: _showAddTransactionBottomSheet,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 50, top: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.black),
              color: Colors.transparent,
            ),
            child: const Text(
              "Add",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Positioned(
            right: 0,
            top: -0,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            StringText.latest,
            style: TextStyle(fontSize: 20),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringText.transactions,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
          const SizedBox(height: 10), // Add some space
          SizedBox(
            height: 170,
            child: _transactions.isEmpty
                ? const Center(
                    child: Text(
                      StringText.notransactions,
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorUtils.backgroundColors,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = _transactions[index];
                      return CreditCardCustom(
                        serviceName: transaction.name,
                        dateTime: transaction.date,
                        amount: transaction.nominal > 0
                            ? '+\$${transaction.nominal}'
                            : '-\$${transaction.nominal.abs()}',
                        imageUrl: transaction.iconUrl,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
