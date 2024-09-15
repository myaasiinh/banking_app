import 'package:banking_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final String cardNumber;
  final String owner;
  final String expiry;
  final bool isPrimary;

  const CreditCard({
    super.key,
    required this.cardNumber,
    required this.owner,
    required this.expiry,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the width of the screen
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          _buildBackCard(screenWidth), // Back card
          _buildFrontCard(screenWidth), // Front card layered on top
        ],
      ),
    );
  }

  // Back Card with circle designs and card number on the left
  Widget _buildBackCard(double screenWidth) {
    return Transform.translate(
      offset: const Offset(0, -25), // Move the back card up
      child: Container(
        height: 200,
        margin: const EdgeInsets.only(top: 30), // Show part of the back card
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: ColorUtils.purpleIllusionist,
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
        child: Stack(
          children: [
            // Position the card number slightly upwards
            Positioned(
              top: 20, // Adjust this value to move the text upwards
              left: 16,
              child: Text(
                cardNumber,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.045, // Adjust font size based on screen width
                  letterSpacing: 1.5,
                ),
              ),
            ),
            // Position the circles slightly upwards and to the right
            Positioned(
              top: 10, // Adjust this value to move the circles upwards
              right: 16, // Adjust for aligning with the card
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribute space between circles
                children: [
                  // First circle
                  Container(
                    width: screenWidth * 0.1, // Adjust size based on screen width
                    height: screenWidth * 0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                  // Second circle overlapping the first one
                  Transform.translate(
                    offset: Offset(-screenWidth * 0.05, 0), // Adjust overlap based on screen width
                    child: Container(
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Front card with number, owner, and other details
  Widget _buildFrontCard(double screenWidth) {
    return Transform.translate(
      offset: const Offset(0, 70), // Move the front card down
      child: Container(
        height: 180,
        width: double.infinity, // Make the width 90% of the screen width
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isPrimary ? Colors.black : Colors.blueAccent,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top section: Card number and Visa logo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Card Number
                Text(
                  cardNumber,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05, // Adjust font size based on screen width
                    letterSpacing: 2.0,
                  ),
                ),
                // Visa logo
                const Text(
                  'VISA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Bottom section: Owner name and Expiry
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Owner's name
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Card Owner',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      owner,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04, // Adjust font size based on screen width
                      ),
                    ),
                  ],
                ),
                // Expiry date
                Text(
                  expiry,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04, // Adjust font size based on screen width
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
