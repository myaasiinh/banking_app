import 'package:flutter/material.dart';

class IconWithTextSendto extends StatelessWidget {
  final String imagePath; // Path to the image asset
  final String label;
  final VoidCallback onPressed;

  const IconWithTextSendto({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            //  color: ColorUtils.mutedGreen, // Background color
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                height: 24, // Adjust the size of the image if needed
                width: 24,
              //  color: ColorUtils.borderSearchColors, // Apply color to the image if needed
              ),
            ),
          ),
        ),
        const SizedBox(height: 8), // Space between image and text
        Text(
          label,
          style: TextStyle(
          //  color: ColorUtils.borderSearchColors, // Text color
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
