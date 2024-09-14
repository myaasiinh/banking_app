import '../../../core/constants/images.dart';
import '../model/transaction_model.dart';

class TransactionData {
  static List<Transaction> getTransactions() {
    return [
      Transaction(
        iconUrl: Images.netflix,
        name: 'Netflix',
        date: '01.12.2022, 14:40',
        nominal: -17.00,
      ),
      Transaction(
        iconUrl: Images.uber,
        name: 'Spotify',
        date: '29.11.2022, 10:15',
        nominal: -10.00,
      ),
      Transaction(
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/f/f1/Google_Pay_Logo.svg',
        name: 'Google Pay',
        date: '28.11.2022, 09:00',
        nominal: 50.00,
      ),
      Transaction(
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/73/Uber_logo_2018.svg',
        name: 'Uber',
        date: '25.11.2022, 19:30',
        nominal: -22.00,
      ),
      Transaction(
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/a1/Apple_logo_grey.svg',
        name: 'Apple Store',
        date: '23.11.2022, 12:00',
        nominal: -100.00,
      ),
    ];
  }
}
