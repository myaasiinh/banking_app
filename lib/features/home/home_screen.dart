
import 'package:banking_app/features/home/widgets/bottom_sheet_form.dart';
import 'package:banking_app/features/home/widgets/credit_card_widget.dart';
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/string.dart';
import '../../core/global_component/credit_card_custom.dart';
import '../../core/global_component/flutter_package.dart';
import '../../core/utils/sqlite_utils.dart';
import '../../data/transaction/dummy/transaction_dummy.dart';
import '../../data/transaction/model/credit_card_model.dart';
import '../../data/transaction/model/transaction_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CreditCardModel> _cards = [];

  @override
  void initState() {
    super.initState();
    _fetchCards();
  }

  Future<void> _fetchCards() async {
    final cards = await DatabaseHelper.instance.queryAllCards();
    setState(() {
      _cards = cards;
    });
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
          const SizedBox(height: 10),
          _buildTransactionsSection(TransactionData.getTransactions()),
          // Other sections
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
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _cards.isNotEmpty
            ? [
          _buildCreditCardWidget(_cards[0]), // First card
          if (_cards.length > 1) _buildCreditCardWidget(_cards[1]), // Second card if available
          if (_cards.length > 2) _buildCreditCardWidget(_cards[2]), // Third card if available
        ]
            : [
          Center(child: Text("No credit cards available")),
        ],
      ),
    );
  }

  Widget _buildCreditCardWidget(CreditCardModel card) {
    return CreditCard(
      cardNumber: card.cardNumber,
      owner: card.owner,
      expiry: card.expiry,
      isPrimary: card.isPrimary,
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => AddCreditCardBottomSheet(),
        ).then((_) {
          _fetchCards(); // Refresh the credit cards list
        });
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, right: 50, top: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorUtils.purpleHoneycreeper,
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                StringText.add,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorUtils.coralOrange,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
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
            height: 170, // Tentukan tinggi yang sesuai atau gunakan media query
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
