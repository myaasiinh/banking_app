import 'package:banking_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TabMenu extends StatefulWidget {
  const TabMenu({super.key});

  @override
  _TabMenuState createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> {
  String selectedTab = 'Daily'; // Track the selected tab.

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4), // Padding around the tabs
      decoration: BoxDecoration(
        color: ColorUtils.lightSkyBlue, // Background color of the container
        borderRadius: BorderRadius.circular(30), // Rounded corners for the outer container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ensure the width fits content
        children: [
          _buildTab('Daily'),
          const SizedBox(width: 10),
          _buildTab('Weekly'),
        ],
      ),
    );
  }

  Widget _buildTab(String label) {
    final bool isSelected = selectedTab == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? ColorUtils.lightTeal : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            )
          ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.white : Colors.black, // Text color adjustment
          ),
        ),
      ),
    );
  }
}
