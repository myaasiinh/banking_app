import 'package:banking_app/core/global_component/flutter_package.dart';
import 'package:banking_app/data/saldo/dummy/saldo_dummy.dart';
import 'package:banking_app/features/saldo/widgets/credit_card_section.dart';
import 'package:banking_app/features/saldo/widgets/icon_with_text.dart';
import 'package:banking_app/features/saldo/widgets/icon_with_text_sendto.dart';
import 'package:flutter/material.dart';

import 'package:banking_app/core/constants/colors.dart';
import 'package:banking_app/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/core/global_component/flutter_package.dart';
import '../../core/global_component/credit_card_custom.dart';
import '../../data/transaction/dummy/transaction_dummy.dart';
import '../../data/transaction/model/transaction_model.dart';

class SaldoScreen extends StatelessWidget {
  const SaldoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions =
        TransactionData.getTransactions(); // Fetching dummy transactions

    return BaseWidgetContainer(
      backgroundColor: ColorUtils.pastelGreen,
      actvateScroll: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          _buildHeader(), // Top header
          const SizedBox(height: 10),
          _buildAfterHeader(),
          _buildCreditCardsSection(), // Section for cards
          const SizedBox(height: 20),
          _buildListIcon(),
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
          // Icon with rounded corner container
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Rounded corner
              color: ColorUtils.mutedGreen, // Light card background color
            ),
            child: IconButton(
              icon: const Icon(Icons.person_2_outlined),
              onPressed: () {},
              color: ColorUtils.borderSearchColors, // Warna icon hitam
            ),
          ),
          // Icon with rounded corner container
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Rounded corner
              color: ColorUtils.mutedGreen, // Light card background color
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications_outlined),
              color: ColorUtils.borderSearchColors, // Warna icon hitam
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAfterHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringText.creditcard,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            StringText.totalbalance,
            style: TextStyle(
              fontSize: 50, // Ubah ukuran teks menjadi lebih besar
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left, // Atur agar teks rata kiri
            overflow: TextOverflow
                .visible, // Biarkan teks melanjutkan ke bawah jika terlalu panjang
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
          CreditCardSection(),
        ],
      ),
    );
  }

  Widget _buildListIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconWithText(
            icon: Icons.send_and_archive_outlined,
            label: 'Send',
            onPressed: () {},
          ),
          IconWithText(
            icon: Icons.call_received_outlined,
            label: 'Receive',
            onPressed: () {},
          ),
          IconWithText(
            icon: Icons.bookmark_added_outlined,
            label: 'Add',
            onPressed: () {},
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
            StringText.lastreceipent,
            style: TextStyle(fontSize: 20),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringText.sendto,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: saldoModels.map((iconModel) {
              return IconWithTextSendto(
                imagePath: iconModel.imagePath,
                label: iconModel.label,
                onPressed: () {
                  // Handle the button press
                },
              );
            }).toList(),
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
