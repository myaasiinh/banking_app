import 'package:banking_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CreditCardSection extends StatelessWidget {
  const CreditCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: ColorUtils.lightMint, // Light card background color
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          child: Row(
            children: [
              // Two overlapping circles
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Background circle
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorUtils.mutedGreen,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                  // Foreground circle overlapping the background circle
                  Positioned(
                    left: 20, // Adjust to overlap the background circle
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(color: ColorUtils.mutedGreen, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 50), // Increase space between circles and account number
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "**** 5482",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: const Text(
            "40 540.74 USD",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
