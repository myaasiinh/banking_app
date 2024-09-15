import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../features/analitik/widgets/barchat_widget.dart';
import '../model/analitik_model.dart';

class AnalitikDummy {

  // Method to provide dummy data
  List<BarChartData> getDummyBarChartData() {
    return [
      BarChartData( color1: ColorUtils.coralOrange,
        color2: ColorUtils.purpleIllusionist,
        height1: 60, // Persentase dari tinggi widget
        height2: 80, // Persentase dari tinggi widget
        text: 'Data 1',
      ),
      BarChartData( color1: ColorUtils.coralOrange,
        color2: ColorUtils.purpleIllusionist,
        height1: 60, // Persentase dari tinggi widget
        height2: 80, // Persentase dari tinggi widget
        text: 'Data 2',
      ),
      BarChartData( color1: ColorUtils.coralOrange,
        color2: ColorUtils.purpleIllusionist,
        height1: 60, // Persentase dari tinggi widget
        height2: 80, // Persentase dari tinggi widget
        text: 'Data 1',
      ),
      BarChartData( color1: ColorUtils.coralOrange,
        color2: ColorUtils.purpleIllusionist,
        height1: 60, // Persentase dari tinggi widget
        height2: 80, // Persentase dari tinggi widget
        text: 'Data 2',
      ),
    ];
  }
}
