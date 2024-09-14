import 'package:flutter/material.dart';

class TabMenu extends StatefulWidget {
  const TabMenu({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabMenuState createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> {
  bool isDailySelected = true; // By default, "Daily" is selected.

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isDailySelected = true;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            decoration: BoxDecoration(
              color: isDailySelected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              boxShadow: isDailySelected
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      )
                    ]
                  : [],
            ),
            child: Text(
              'Daily',
              style: TextStyle(
                fontSize: 16,
                fontWeight: isDailySelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              isDailySelected = false;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            decoration: BoxDecoration(
              color: !isDailySelected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              boxShadow: !isDailySelected
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      )
                    ]
                  : [],
            ),
            child: Text(
              'Weekly',
              style: TextStyle(
                fontSize: 16,
                fontWeight: !isDailySelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
