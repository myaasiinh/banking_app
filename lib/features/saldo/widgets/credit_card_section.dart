import 'package:flutter/material.dart';

class CreditCardSection extends StatelessWidget {
  const CreditCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Credit Card",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.green[200], // Light card background color
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            children: [
              Text(
                "**** 5482",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "40 540.74 USD",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}