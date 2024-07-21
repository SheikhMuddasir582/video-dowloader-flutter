import 'package:flutter/material.dart';

import '../../utils/App Colors/constants.dart';
import '../../view/Home Screens/home_screen.dart';
import '../../view/Files Screens/progress_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final List<BottomNavigationBarItem> items;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      // currentIndex: selectedIndex,
      // selectedItemColor: appColor,
      unselectedItemColor: Colors.grey, // Set the color for unselected items
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      selectedItemColor: appColor, // Set the type to fixed
      onTap: (index) {
        onItemSelected(index);
        switch (index) {
          case 0:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
            break;
          case 1:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProgressScreen()));
            break;
          case 2:
            // Add navigation logic for the third item if needed
            break;
          default:
            break;
        }
      },
    );
  }
}
