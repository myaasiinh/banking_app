
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const IconWithText({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), // Rounded corners
            color: ColorUtils.mutedGreen, // Background color
          ),
          child: IconButton(
            icon: Icon(icon),
            onPressed: onPressed,
            color: ColorUtils.borderSearchColors, // Icon color
          ),
        ),
        const SizedBox(height: 8), // Space between icon and text
        Text(
          label,
          style: TextStyle(
            color: ColorUtils.borderSearchColors, // Text color
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
