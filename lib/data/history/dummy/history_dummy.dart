import '../../../core/constants/images.dart';
import '../model/history_model.dart';

class HistoryData {
  static List<HistoryModel> getHistory() {
    return [
      HistoryModel(
        iconUrl: Images.netflix,
        name: 'Netflix',
        date: '01.12.2022, 14:40',
        nominal: -17.00,
      ),
      HistoryModel(
        iconUrl: Images.spotify,
        name: 'Spotify',
        date: '29.11.2022, 10:15',
        nominal: -10.00,
      ),
      HistoryModel(
        iconUrl: Images.googleplay,
        name: 'Google Pay',
        date: '28.11.2022, 09:00',
        nominal: 50.00,
      ),
      HistoryModel(
        iconUrl: Images.uber,
        name: 'Uber',
        date: '25.11.2022, 19:30',
        nominal: -22.00,
      ),
      HistoryModel(
        iconUrl: Images.appstore,
        name: 'Apple Store',
        date: '23.11.2022, 12:00',
        nominal: -100.00,
      ),
    ];
  }
}
