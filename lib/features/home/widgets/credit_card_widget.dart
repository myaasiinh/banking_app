import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final String cardNumber;
  final String owner;
  final String expiry;
  final bool isPrimary;

  const CreditCard({super.key, 
    required this.cardNumber,
    required this.owner,
    required this.expiry,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPrimary ? Colors.black : Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            cardNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2.0,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                owner,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                expiry,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}