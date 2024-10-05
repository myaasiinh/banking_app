import 'package:banking_app/features/analitik/widgets/bar_chat_desc.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../features/analitik/widgets/barchat_widget.dart'; // Pastikan path import sesuai
import '../../core/constants/string.dart';
import '../../core/global_component/credit_card_custom.dart';
import '../../core/utils/sqlite_utils.dart';
import '../../data/analitik/dummy/analitik_dummy.dart'; // Pastikan path import sesuai
import '../../data/analitik/model/analitik_model.dart';
import '../../data/transaction/dummy/transaction_dummy.dart';
import '../../data/transaction/model/transaction_model.dart';
import '../../features/analitik/widgets/tab_menu_widget.dart'; // Pastikan path import sesuai

class AnalitikScreen extends StatefulWidget {
  const AnalitikScreen({super.key});

  @override
  State<AnalitikScreen> createState() => _AnalitikScreenState();
}

class _AnalitikScreenState extends State<AnalitikScreen> {
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

  @override
  Widget build(BuildContext context) {
    final analitikDummy = AnalitikDummy();
    final List<BarChartData> barChartDataList = analitikDummy.getDummyBarChartData();

    return Scaffold(
      backgroundColor: ColorUtils.skyBlue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildHeader(), // Top header
            const SizedBox(height: 10),
            _buildAfterHeader(),
            const SizedBox(height: 10),
            _buildCreditCardsSection(), // Section for cards
            const SizedBox(height: 10),
            _buildBarChartsSection(barChartDataList), // Section for bar charts
            _buildTransactionsSection(), // Section for transactions
          ],
        ),
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
              color: ColorUtils.lightTeal, // Light card background color
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
              color: ColorUtils.lightTeal, // Light card background color
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
            StringText.optimizeperformance,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            StringText.analitik,
            style: TextStyle(
              fontSize: 30, // Ubah ukuran teks menjadi lebih besar
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
          Center(child: TabMenu()),
        ],
      ),
    );
  }

  Widget _buildBarChartsSection(List<BarChartData> barChartDataList) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringText.totalbalance,
                style: TextStyle(fontSize: 20),
              ),
              BarChartDesc(
                color1: ColorUtils.coralOrange,
                color2: ColorUtils.purpleIllusionist,
                textValue1: 'Income',
                textValue2: 'Outcome',
              ),

            ],
          ),
          SizedBox(
            height: 200, // Adjust height as needed
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: barChartDataList.map((data) => SizedBox(
                  width: 150, // Adjust width as needed
                  child: BarChart(
                    data: data,
                  ),
                )).toList(),
              ),
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
            StringText.creditcard,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringText.history,
                style: TextStyle(fontSize: 30, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 170,
            child: _transactions.isEmpty
                ? const Center(
              child: Text(
                StringText.nohistoryaddDatafromHome,
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
