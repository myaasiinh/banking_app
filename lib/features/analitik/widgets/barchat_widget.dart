import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarchatWidget extends StatelessWidget {
  const BarchatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 50,
        barGroups: [
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(fromY: 15, color: Colors.blue, toY: 4),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(fromY: 15, color: Colors.blue, toY: 4),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(fromY: 15, color: Colors.blue, toY: 4),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(fromY: 15, color: Colors.blue, toY: 4),
            ],
          ),
        ],
      ),
    );
  }
}
