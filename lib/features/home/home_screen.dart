import 'package:banking_app/core/constants/colors.dart';
import 'package:banking_app/core/constants/string.dart';
import 'package:banking_app/core/global_component/flutter_package.dart';
import 'package:flutter/material.dart';

import '../../core/global_component/credit_card_custom.dart';
import '../../data/transaction/dummy/transaction_dummy.dart';
import '../../data/transaction/model/transaction_model.dart';
import 'widgets/credit_card_widget.dart'; // Importing the model for transactions

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions =
        TransactionData.getTransactions(); // Fetching dummy transactions

    return BaseWidgetContainer(
      backgroundColor: ColorUtils.purplishBlue,
      actvateScroll: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          _buildHeader(), // Top header
          const SizedBox(height: 10),
          _buildAfterHeader(),
          _buildCreditCardsSection(), // Section for cards
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
          // Icon with rounded corner container
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Rounded corner
              color: ColorUtils.purpleHoneycreeper, // Warna icon hitam
            ),
            child: IconButton(
              icon: const Icon(Icons.person_2_outlined),
              onPressed: () {},
              color: ColorUtils.backgroundColors, // Warna icon hitam
            ),
          ),
          // Icon with rounded corner container
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Rounded corner
              color: ColorUtils.purpleHoneycreeper, // Warna icon hitam
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications_outlined),
              color: ColorUtils.backgroundColors, // Warna icon hitam
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
                width:
                    150, // Set lebar maksimum teks, jika terlalu panjang akan wrap ke bawah
                child: Text(
                  StringText.allcreditcard,
                  style: TextStyle(
                    fontSize: 35, // Ubah ukuran teks menjadi lebih besar
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left, // Atur agar teks rata kiri
                  overflow: TextOverflow
                      .visible, // Biarkan teks melanjutkan ke bawah jika terlalu panjang
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
      onTap: () {
        // Action when "Add" button is pressed
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background Button with Text
          Container(
            padding: const EdgeInsets.only(
                left: 16,
                right: 50,
                top: 10,
                bottom: 10), // Added padding to right to prevent overlap
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Rounded corner
              border: Border.all(color: Colors.black), // Outline abu-abu
              color: Colors.transparent, // Background transparan
            ),
            child: const Text(
              "Add",
              style: TextStyle(color: Colors.black), // Warna tulisan abu-abu
            ),
          ),
          // Icon with Circle that overlaps but stays aligned
          Positioned(
            right: 0, // Align circle icon with button's right edge
            top: -0, // Slight adjustment to center it vertically
            child: Container(
              width: 40, // Circular container size
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black, // Background lingkaran abu-abu
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ),
        ],
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
            StringText.latest,
            style: TextStyle(fontSize: 20),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringText.transactions,
                style: TextStyle(fontSize: 25, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
          SizedBox(
            height: 130, // Tentukan tinggi yang sesuai atau gunakan media query
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
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
