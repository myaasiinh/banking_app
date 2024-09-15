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
        iconUrl: Images.spotify,
        name: 'Spotify',
        date: '29.11.2022, 10:15',
        nominal: -10.00,
      ),
      Transaction(
        iconUrl: Images.googleplay,
        name: 'Google Pay',
        date: '28.11.2022, 09:00',
        nominal: 50.00,
      ),
      Transaction(
        iconUrl: Images.uber,
        name: 'Uber',
        date: '25.11.2022, 19:30',
        nominal: -22.00,
      ),
      Transaction(
        iconUrl: Images.appstore,
        name: 'Apple Store',
        date: '23.11.2022, 12:00',
        nominal: -100.00,
      ),
    ];
  }
}
