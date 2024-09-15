import 'package:flutter/material.dart';

class BarChartDesc extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String textValue1;
  final String textValue2;

  const BarChartDesc({
    required this.color1,
    required this.color2,
    required this.textValue1,
    required this.textValue2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIconText(color1, textValue1), // Icon with color1 and textValue1
        const SizedBox(width: 8), // Space between icon and text
        _buildIconText(color2, textValue2), // Icon with color2 and textValue2
      ],
    );
  }

  Widget _buildIconText(Color color, String text) {
    return Row(
      children: [
        Icon(
          Icons.circle, // Icon representing the color
          color: color,
          size: 16.0, // Adjust icon size as needed
        ),
        const SizedBox(width: 8), // Space between icon and text
        Text(
          text,
          style: const TextStyle(
            fontSize: 14, // Adjust font size as needed
          ),
        ),
      ],
    );
  }
}
