import 'package:banking_app/core/constants/string.dart';

import '../../../core/constants/colors.dart';
import '../model/analitik_model.dart';

class AnalitikDummy {
  // Method to provide dummy data
  List<BarChartData> getDummyBarChartData() {
    return [
      BarChartData( color1: ColorUtils.coralOrange,
        color2: ColorUtils.purpleIllusionist,
        height1: 40, // Persentase dari tinggi widget
        height2: 60, // Persentase dari tinggi widget
        text: StringText.januari2003,
      ),
      BarChartData( color1: ColorUtils.coralOrange,
        color2: ColorUtils.purpleIllusionist,
        height1: 45, // Persentase dari tinggi widget
        height2: 70, // Persentase dari tinggi widget
        text: StringText.februari2003,
      ),
      BarChartData( color1: ColorUtils.coralOrange,
        color2: ColorUtils.purpleIllusionist,
        height1: 60, // Persentase dari tinggi widget
        height2: 50, // Persentase dari tinggi widget
        text: StringText.maret2003,
      ),
      BarChartData( color1: ColorUtils.coralOrange,
        color2: ColorUtils.purpleIllusionist,
        height1: 60, // Persentase dari tinggi widget
        height2: 45, // Persentase dari tinggi widget
        text: StringText.now,
      ),
    ];
  }
}
