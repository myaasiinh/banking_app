import 'package:flutter/material.dart';

import '../../../data/analitik/model/analitik_model.dart';

class BarChart extends StatelessWidget {
  final BarChartData data;
  final double barWidth;
  final double barSpacing;

  const BarChart({super.key,
    required this.data,
    this.barWidth = 20.0,
    this.barSpacing = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPaint(
          size: const Size(double.infinity, 150), // Sesuaikan dengan ukuran yang diinginkan
          painter: BarChartPainter(
            color1: data.color1,
            color2: data.color2,
            height1: data.height1,
            height2: data.height2,
            barWidth: barWidth,
            barSpacing: barSpacing,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(data.text),
      ],
    );
  }
}

class BarChartPainter extends CustomPainter {
  final Color color1;
  final Color color2;
  final double height1;
  final double height2;
  final double barWidth;
  final double barSpacing;

  BarChartPainter({
    required this.color1,
    required this.color2,
    required this.height1,
    required this.height2,
    required this.barWidth,
    required this.barSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint1 = Paint()
      ..color = color1
      ..style = PaintingStyle.fill;

    final Paint paint2 = Paint()
      ..color = color2
      ..style = PaintingStyle.fill;

    final double barHeight1 = size.height * (height1 / 100);
    final double barHeight2 = size.height * (height2 / 100);

    final Rect rect1 = Rect.fromLTWH(
      (size.width / 2) - barWidth - barSpacing / 2,
      size.height - barHeight1,
      barWidth,
      barHeight1,
    );

    final Rect rect2 = Rect.fromLTWH(
      (size.width / 2) + barSpacing / 2,
      size.height - barHeight2,
      barWidth,
      barHeight2,
    );

    const Radius radius = Radius.circular(8.0);

    final RRect rrect1 = RRect.fromRectAndRadius(rect1, radius);
    final RRect rrect2 = RRect.fromRectAndRadius(rect2, radius);

    canvas.drawRRect(rrect1, paint1);
    canvas.drawRRect(rrect2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
