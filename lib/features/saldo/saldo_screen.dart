import 'package:banking_app/core/constants/colors.dart';
import 'package:banking_app/core/constants/string.dart';
import 'package:banking_app/core/global_component/flutter_package.dart';
import 'package:banking_app/features/saldo/widgets/credit_card_section.dart';
import 'package:banking_app/features/saldo/widgets/icon_with_text.dart';
import 'package:flutter/material.dart';
import '../../core/global_component/credit_card_custom.dart';
import '../../core/utils/sqlite_utils.dart';
import '../../data/transaction/model/transaction_model.dart';
import '../../core/global_component/bottom_sheet_form.dart';

class SaldoScreen extends StatefulWidget {
  const SaldoScreen({super.key});

  @override
  State<SaldoScreen> createState() => _SaldoScreenState();
}

class _SaldoScreenState extends State<SaldoScreen> {
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
// Fetching dummy transactions

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      backgroundColor: ColorUtils.pastelGreen,
      actvateScroll: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          _buildHeader(), // Top header
          const SizedBox(height: 10),
          _buildAfterHeader(),
          _buildCreditCardsSection(), // Section for cards
          const SizedBox(height: 20),
          _buildListIcon(),
          const SizedBox(height: 20),
          _buildTransactionsSection(), // Section for transactions
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
              color: ColorUtils.backgroundColors, // Warna icon hitam
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
              color: ColorUtils.backgroundColors, // Warna icon hitam
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
      padding: EdgeInsets.symmetric(horizontal: 50.0),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            onPressed: () {
              _showAddTransactionBottomSheet();
            },
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
            StringText.lastreceipent,
            style: TextStyle(fontSize: 20),
          ),
          const Text(
            StringText.sendto,
            style: TextStyle(
                fontSize: 35,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 170,
            child: _transactions.isEmpty
                ? const Center(
                    child: Text(
                      StringText.notransactions,
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorUtils.purpleIllusionist,
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
